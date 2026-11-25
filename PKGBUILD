# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=luksbox-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Store sensitive files in encrypted containers on the cloud or shared media"
arch=('x86_64' 'aarch64')
url="https://github.com/PentHertz/LUKSbox"
license=('Apache-2.0')
depends=('glibc' 'libfido2' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/luksbox-x86_64-linux-jammy.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/luksbox-aarch64-linux-jammy.tar.gz")
sha256sums_x86_64=('22d3e75d8de2dd596cf0faf6cb2c6c7eb7c663e1d9393c040f193a10ab70eca6')
sha256sums_aarch64=('375b2527125cc0e03cbc51393e022fe5f9093a9262204d000e04010729812531')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="." ;;
    aarch64) _dir="." ;;
  esac
  install -Dm755 "${_dir}/luksbox-gui" "${pkgdir}/usr/bin/luksbox-gui"
  install -Dm755 "${_dir}/luksbox" "${pkgdir}/usr/bin/luksbox"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
