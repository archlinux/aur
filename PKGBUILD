# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=kicad-symbols-git
_pkgname=${pkgname%-*}
pkgver=2c615cc
pkgrel=1
pkgdesc="Official KiCad schematic symbol libraries"
arch=('any')
url="https://github.com/KiCad/kicad-symbols"
license=('GPL')
makedepends=('cmake' 'git')
conflicts=('kicad-library-bzr' 'kicad-library-git' 'kicad-library-3d' 'kicad-library')
source=("git://github.com/KiCad/kicad-symbols.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD # Fix to better comply with github display
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
