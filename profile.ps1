# ====================================== #
# === Windows PowerShell Config File === #
# ====================================== #
clear

$ROOT="C:\var\www"
Set-Location $ROOT

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$PS=(Get-Host).UI.RawUI
$PS.WindowTitle = "TwystO PowerShell"

$size = $PS.WindowSize
$size.Width = 140
$size.Height = 35
$PS.WindowSize = $size

$buff = $PS.BufferSize
$buff.Width = 145
$buff.height = 5000
$PS.BufferSize = $buff

function Get-Hour { Get-Date -f "HH" }
function Get-Minute { Get-Date -f "mm" }
function Get-Second { Get-Date -f "ss" }

function prompt {
    Write-Host "[" -ForegroundColor 1 -noNewLine
    Write-Host (Get-Hour) -ForegroundColor 6 -noNewLine
    Write-Host ":" -ForegroundColor 3 -noNewLine
    Write-Host (Get-Minute) -ForegroundColor 6 -noNewLine
    Write-Host ":" -ForegroundColor 3 -noNewLine
    Write-Host (Get-Second) -ForegroundColor 6 -noNewLine
    Write-Host "]" -ForegroundColor 1 -noNewLine

    Write-Host " " -noNewLine

    Write-Host $ENV:USERNAME -ForegroundColor 5 -noNewLine
    Write-Host "@" -ForegroundColor 2 -noNewLine
    Write-Host $(Hostname) -ForegroundColor 5 -noNewLine
    Write-Host ":" -ForegroundColor 6 -noNewLine

    Write-Host " " -noNewLine

    Write-Host $($(Get-Location).Path.replace($ROOT, "~")) -ForegroundColor 12 -noNewLine

    return "$ "
}

Clear-Item Alias:ls
