# Maintainer: David Lasek <mail at davidlasek dot eu>
pkgname=rofi-blocks-git
_gitroot='rofi-blocks'
pkgver=0.r1.a865916
pkgrel=1
pkgdesc="rofi modi for controlling rofi content through communication with an external program"
arch=("any")
url="https://github.com/OmarCastro/${_gitroot}"
license=('GPL')
depends=(rofi json-glib)
makedepends=(git automake)
optdepends=()
source=("git://github.com/OmarCastro/${_gitroot}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitroot}"
  printf "0.r1.%s" "$(git rev-parse --short HEAD | sed 's/-/./g')"
}

build() {
    cd "${srcdir}/${_gitroot}"
    autoreconf -i
    mkdir build
    cd build/
	../configure
	make
}

package() {
    cd "${srcdir}/${_gitroot}"
    cd build/
	make DESTDIR="$pkgdir/" install
}
