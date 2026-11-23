# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=retiretui-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="A local-first retirement planner for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/kenianbei/retiretui"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/retiretui-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/retiretui-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('fbbce1563c69c9f7cef5fb244f3559ec622082cf10916ed3b22bd84c74555ff2')
sha256sums_aarch64=('9e44e5f8f8013b304730e34b6cc536480210cfeb170cb1d7ec93c928ab90bf91')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="retiretui-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="retiretui-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "retiretui" "${pkgdir}/usr/bin/retiretui"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
