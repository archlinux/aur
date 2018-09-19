# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-footprints-git
_pkgname=kicad-footprints
pkgver=r2391.2d650a05
pkgrel=1
pkgdesc="KiCad footprint libraries from the official git repo"
arch=('any')
url="https://github.com/KiCad/kicad-footprints"
license=('GPL')
makedepends=('cmake' 'git')
options=('!strip')
conflicts=('kicad-library-bzr' 'kicad-library-git' 'kicad-library-3d' 'kicad-library' 'kicad-footprints')
provides=('kicad-footprints')
source=("git://github.com/KiCad/kicad-footprints.git")
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
