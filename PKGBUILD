# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname=qman-git
pkgver=1.3.0
pkgrel=1
pkgdesc="A more modern manual page viewer for our terminals"

arch=('x86_64')
url="https://github.com/plp13/qman/tree/v1.3.0"
license=("BSD-2-CLAUSE")
depends=("ncurses" "libinih" "zlib")
optdepends=("bzip2: support for bzip2-compressed man pages")
makedepends=("git" "meson" "python-cogapp")
source=("$pkgname"::"git+https://github.com/plp13/qman.git")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  sed -i "s/install_dir\: 'man\/man1'/install_dir: 'share\/man\/man1'/g" "man/meson.build"
  meson setup "build/"
  cd "build/"
  meson configure -Dprefix="/usr"
  meson compile
}

package() {
  cd "${pkgname}"
  cd "build/"
  meson install --destdir "${pkgdir}"
}
