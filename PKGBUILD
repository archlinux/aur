# Maintainer: Baron Hou <houbaron@gmail.com>

pkgname=archisteamfarm-bin
pkgver=4.1.1.7
pkgrel=1
pkgdesc="C# application that allows you to farm steam cards using multiple steam accounts simultaneously."
arch=('x86_64')
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=("Apache License 2.0")
depends=(dotnet-runtime)
makedepends=("unzip" "curl" "jq")
noextract=('ASF-linux-x64.zip')
options=("!strip" "staticlibs")

source=(
    "https://github.com/JustArchiNET/ArchiSteamFarm/releases/latest/download/ASF-linux-x64.zip"
    "LICENSE-2.0.txt"
    "ArchiSteamFarm-bin.desktop"
)

md5sums=(
    'SKIP'
    '175792518e4ac015ab6696d16c4f607e'
    '98654afd36cae629f570ff0510669ba2'
)

pkgver() {
    curl -s https://api.github.com/repos/JustArchiNET/ArchiSteamFarm/releases/latest | jq -r '.tag_name'
}

prepare() {
    rm -rf "ASF"
    unzip ASF-linux-x64.zip -d "ASF"
}

package() {
    install -Dm644 "LICENSE-2.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "ArchiSteamFarm-bin.desktop" "${pkgdir}/usr/share/applications/ArchiSteamFarm-bin.desktop"

    install -Dm755 "./ASF/ArchiSteamFarm" "${pkgdir}/opt/ArchiSteamFarm-bin/ArchiSteamFarm"
    cp -r "${srcdir}/ASF"/* "${pkgdir}/opt/ArchiSteamFarm-bin/"

    rm -f "$srcdir/../ASF-linux-x64.zip"
}

