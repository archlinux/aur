# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=retiretui-bin
pkgver=0.6.0
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
sha256sums_x86_64=('86dfa5c3fa20c2d0e46b2c5ace171b3aacb9120703b3eab5e87e9c463176c178')
sha256sums_aarch64=('cc1471766e5dedae8d7a06e865a833457e1a12b13b588a5cf39f375f8192af2c')

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
