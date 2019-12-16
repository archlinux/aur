# Maintainer: Grey Christoforo <firstname@lastname.net>

pkgbase=kicad-library-git
pkgname=('kicad-library-git' 'kicad-library-3d-git')
pkgver=r5733.be973eca
pkgrel=1
arch=('any')
url="https://github.com/KiCad"
license=('GPL')
makedepends=('cmake' 'git')
options=('!strip')
conflicts=('kicad-library-bzr' 'kicad-library-git' 'kicad-library-3d' 'kicad-library' 'kicad-footprints')
provides=('kicad-footprints')

source=("git://github.com/KiCad/kicad-symbols.git"
	"git://github.com/KiCad/kicad-footprints.git"
	"git://github.com/KiCad/kicad-packages3D.git"
	"git://github.com/KiCad/kicad-templates.git")

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/kicad-symbols"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/kicad-symbols/"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make

  cd "$srcdir/kicad-footprints/"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make

  cd "$srcdir/kicad-packages3D/"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make

  cd "$srcdir/kicad-templates/"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package_kicad-library-git() {
  pkgdesc="Kicad component libraries, footprint libraries and templates"
  cd "$srcdir/kicad-symbols"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/kicad-footprints/"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/kicad-templates/"
  make DESTDIR="$pkgdir" install
}

package_kicad-library-3d-git() {
  pkgdesc="Kicad 3D render model libraries"
  cd "$srcdir/kicad-packages3D/"
  make DESTDIR="$pkgdir" install
}

