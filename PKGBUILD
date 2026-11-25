# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fakecloud-bin
pkgver=0.52.0
pkgrel=1
pkgdesc="Open-source AWS emulator"
arch=('x86_64' 'aarch64')
url="https://github.com/faiscadev/fakecloud"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fakecloud-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fakecloud-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('1edf2ada0fcc0def610b748a21421cc2f4ed827eb2ed6bc5f8a2fdc041c8f7aa')
sha256sums_aarch64=('cea517e5594607ee2ca11c2d468e116bebd70f9c6c913d0b393d2db1b17b2a81')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="fakecloud-v${pkgver}-linux-amd64" ;;
    aarch64) _dir="fakecloud-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/fakecloud" "${pkgdir}/usr/bin/fakecloud"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
