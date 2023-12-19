# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname=qman-git
pkgver=nightly
pkgrel=1
pkgdesc="A more modern manual page viewer for our terminals"

arch=('x86_64')
url="https://github.com/plp13/qman"
license=('BSD-2-CLAUSE')
depends=('ncurses' 'libinih')
makedepends=('git' 'meson' 'pandoc')
source=("$pkgname"::"git+https://github.com/plp13/qman.git")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  meson setup "build/" "src/"
  cd "build/"
  meson configure -Dprefix="/usr"
  meson compile
}

package() {
  cd "${pkgname}"
  cd "build/"
  meson install --destdir "${pkgdir}"
}
