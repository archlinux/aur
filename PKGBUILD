# Maintainer: David Lasek <mail at davidlasek dot eu>
pkgname=rofi-blocks-git
_gitroot='rofi-blocks'
pkgver=r78.50962f7
pkgrel=1
pkgdesc="rofi modi for controlling rofi content through communication with an external program"
arch=("any")
url="https://github.com/OmarCastro/${_gitroot}"
license=('GPL')
depends=(rofi json-glib)
makedepends=(git automake)
optdepends=()
source=("git+https://github.com/OmarCastro/${_gitroot}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitroot}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD | sed 's/-/./g')"
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
