# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rada-fm-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A terminal file manager that shows a plan before every operation, with a journal, undo"
arch=('x86_64' 'aarch64')
url="https://github.com/FormikaDesk/rada-fm"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rada-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rada-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('996ce078d0180c6e55f89336cc52d91f686b6807a35447d8b4b0c54a115740d4')
sha256sums_aarch64=('755e820920794a5bb981818c381e1ab012f11dd60fa692401628d42a23295019')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="rada-${pkgver}-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="rada-${pkgver}-aarch64-unknown-linux-musl" ;;
  esac
  cd "$_dir"
  install -Dm755 "rada" "${pkgdir}/usr/bin/rada"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
