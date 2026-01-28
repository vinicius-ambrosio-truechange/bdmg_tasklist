$StartTime = $(get-date)
Write-Host "Stage - Build Android ---------------------------------------------------------"

try {
    Set-Location .\android\
    $env:JAVA_HOME = 'C:\programs\jdk21' # JAVA21
    $env:ANDROID_HOME = 'C:\programs\Android\SDK\'
    
    Write-Host "Starting Android APK Debug Build -------------------------------------------"
    $cmd = ".\gradlew.bat assembleAppstoreDebug --stacktrace"
    Invoke-Expression $cmd
    Write-Host "Android APK Build Debug Complete."

    # Write-Host "Starting Android MIN Debug Build ------------------------------------------"
    # $cmd = ".\gradlew.bat assembleDevDebug --stacktrace"
    # Invoke-Expression $cmd
    # Write-Host "Android MIN Build Debug Complete."

    # Write-Host "Starting Android APK Release Build -----------------------------------------"
    # $cmd = ".\gradlew.bat assembleAppstoreRelease --stacktrace"
    # Invoke-Expression $cmd
    # Write-Host "Android APK Build Release Complete."

    # Write-Host "Starting Android AAB Release Unsigned Build -------------------------------"
    # $cmd = ".\gradlew.bat bundleAppstoreRelease --stacktrace"
    # Invoke-Expression $cmd
    # Write-Host "Android AAB Build Release Unsigned Complete."
}
catch {
    Write-Error "Error when executing Gradle"
}

Set-Location .\..\
$elapsedTime = $(get-date) - $StartTime
Write-Host "Elapsed Time: $elapsedTime"
exit $LASTEXITCODE # 0 for success and 1 for failure