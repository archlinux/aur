# Maintainer: Knut Ahlers <knut@ahlers.me>
# Contributor: Baron Hou <houbaron@gmail.com>

pkgname=archisteamfarm-bin
pkgver=5.4.2.13
pkgrel=1
pkgdesc="C# application that allows you to farm steam cards using multiple steam accounts simultaneously."
arch=('x86_64')
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=("Apache")
depends=(dotnet-runtime)
makedepends=("unzip" "curl" "jq")
noextract=('ASF-linux-x64.zip')
options=("!strip" "staticlibs")

source=(
  "${pkgname}-${pkgver}.zip::https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/${pkgver}/ASF-linux-x64.zip"
  "ArchiSteamFarm-bin.desktop"
)

sha512sums=('87cf8f616f270763e7125918bf6830966bee0d9c768c5657eabf53822344984761e935bab10175b3e6846d1b10b1e9471fc501597f9ab9eddc689fbc6fedcea0'
            '32aaead4aacc02c9c60afef74e04cb3a30afc4d76f5e6836a05e672344c7db66cf099849cb2bc9a04454a026f99c9f60d3d7186f4a496d4626fe1a3d40d4ecf6')

prepare() {
  unzip "${pkgname}-${pkgver}.zip" -d "ASF"
}

package() {
  install -Dm644 -t "${pkgdir}/usr/share/applications" "ArchiSteamFarm-bin.desktop"

  install -d "${pkgdir}/opt/ArchiSteamFarm-bin"
  cp -r "${srcdir}/ASF"/* "${pkgdir}/opt/ArchiSteamFarm-bin/"
  install -Dm755 -t "${pkgdir}/opt/ArchiSteamFarm-bin" "${srcdir}/ASF/ArchiSteamFarm"
}
