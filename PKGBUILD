# Maintainer: Grey Christoforo <firstname@lastname.net>

pkgname=kicad-library-git
pkgver=r5733.be973eca
pkgdesc="Kicad component libraries, footprint libraries, component 3d models and project templates from git"
conflicts=('kicad-library-3d' 'kicad-library-bzr' 'kicad-library' 'kicad-footprints' 'kicad-footprints-git' 'kicad-symbols-git' 'kicad-templates-git')
provides=('kicad-library' 'kicad-library-3d')
pkgrel=1
arch=('any')
url="https://github.com/KiCad"
license=('GPL')
makedepends=('cmake' 'git')
options=('!strip')

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

package() {
  cd "$srcdir/kicad-symbols"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/kicad-footprints/"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/kicad-templates/"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/kicad-packages3D/"
  make DESTDIR="$pkgdir" install
}
