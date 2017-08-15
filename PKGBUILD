pkgname=open-phd-guiding-git
pkgver=r2016.6240b87a
pkgrel=4
pkgdesc="Open PHD Guiding - PHD2 astrophotography autoguiding tool"
url="http://openphdguiding.org/"
arch=('i686' 'x86_64')
license=('BSD3')
depends=('wxgtk' 'v4l-utils' 'zlib' 'cfitsio' 'opencv' 'libnova' 'libindi')
makedepends=('git' 'cmake')
source=("git+https://github.com/OpenPHDGuiding/phd2.git")
sha1sums=('SKIP')

_gitname='phd2'

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_gitname
	patch -p1 < ../../nova.patch
	cd -
	mkdir build
	cd build
	cmake ../$_gitname
}

build() {
	cd build
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}

