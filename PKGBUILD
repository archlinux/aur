# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-symbols-git
_pkgname=kicad-symbols
pkgver=r2799.f354247
pkgrel=1
pkgdesc="KiCad schematic symbol libraries from the official git repo"
arch=('any')
url="https://github.com/KiCad/kicad-symbols"
license=('GPL')
makedepends=('cmake' 'git')
conflicts=('kicad-library-bzr' 'kicad-library-git' 'kicad-library-3d' 'kicad-library' 'kicad-symbols')
provices=('kicad-symbols')
source=("git://github.com/KiCad/kicad-symbols.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  mkdir -p "$srcdir/build/"
  cd "$srcdir/build"
  cmake ../${_pkgname} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}
