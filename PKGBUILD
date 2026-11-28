# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=presse-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="PDF processing CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/SimonBure/presse"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/presse-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/presse-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('febdd46c0ea2b4c87d2833aee4f8c6900daf6d297e18d0907546ef17773f7a2a')
sha256sums_aarch64=('09202892c2ce248d60f8220cb6dfea8740b6af49b7a1f8872ccc27f615d2c83c')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="presse-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="presse-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/presse" "${pkgdir}/usr/bin/presse"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
