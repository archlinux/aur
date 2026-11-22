# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ratslate-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="An infinite-canvas whiteboard driven by the mouse"
arch=('x86_64' 'aarch64')
url="https://github.com/azihsoyn/ratslate"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/ratslate-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/ratslate-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('3fcf094228d8dc21c0e6358265a1fc82fecad58cc0fc0089a3cfcfa027dc3590')
sha256sums_aarch64=('54a784006dfd0085c736c09c78450df9aa1189fd187fbfbd7679e707d6b0868d')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="ratslate-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="ratslate-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "ratslate" "${pkgdir}/usr/bin/ratslate"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
