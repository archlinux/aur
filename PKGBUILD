# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rex-tui-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A TUI for managing Incomes"
arch=('x86_64' 'aarch64')
url="https://github.com/TheRustyPickle/Rex"
license=('MIT')
depends=('glibc' 'libgcc' 'wayland')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/rex-tui-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/rex-tui-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('326b96c244d11cd2e616ee10b47e1af877e1f3baad94d61ebc1a2a7c9b7d092c')
sha256sums_aarch64=('c7de57d81d7b03d5699163182abd0d592af75311f43893860b54d1bfc9db3245')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="rex-tui-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="rex-tui-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "rex" "${pkgdir}/usr/bin/rex"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
