# Maintainer: Jat <chat@jat.email>

pkgname=archisteamfarm-bin
pkgver=5.4.7.2
pkgrel=1
pkgdesc='C# application that allows you to farm steam cards using multiple steam accounts simultaneously.'
arch=('x86_64')
url='https://github.com/JustArchiNET/ArchiSteamFarm'
license=('Apache')
depends=('dotnet-runtime')
makedepends=('unzip' 'curl' 'jq')
noextract=('ASF-linux-x64.zip')
options=('!strip' 'staticlibs')

source=(
  "${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/ASF-linux-x64.zip"
  "ArchiSteamFarm-bin.desktop"
)

sha512sums=('6afcf908443f3e60992af0ac71e2a32d7a6859b9dff15f4dcace65c92d89a10bf86bf319980b39c385ee5e0e982bc81022dce7f4e0446af096febec996d8f44b'
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
