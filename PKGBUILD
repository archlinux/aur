# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=retiretui-bin
pkgver=0.7.0
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
sha256sums_x86_64=('1477bc6dd7ff3f141021667247e49c8745a9b2e7996e659d13dc1bc823fd5c5b')
sha256sums_aarch64=('9f521b7f3caa38731016b88c66c85d1d4569decf6e00486108bca3d9252d761f')

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
