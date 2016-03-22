pkgname=open-phd-guiding-git
pkgver=r1421.1f798c6
pkgrel=1
pkgdesc="Open PHD Guiding - PHD2 astrophotography autoguiding tool"
url="http://openphdguiding.org/"
arch=('i686' 'x86_64')
license=('BSD3')
depends=('wxgtk' 'v4l-utils' 'zlib' 'cfitsio' 'opencv')
makedepends=('git cmake')
source=("git+https://github.com/OpenPHDGuiding/phd2.git")
sha1sums=('SKIP')

_gitname='phd2'

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p build
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

