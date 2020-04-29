# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=pep-qt-adapter-hg
_name=pEpQtAdapter
pkgver=r30.095eb68b2808
pkgrel=1
pkgdesc="p≡p Qt adapter"
url="https://pep.foundation/dev/repos/pEpQtAdapter"
license=('GPL3')
arch=( 'any' )
depends=('qt5-base' 'pep-engine')
makedepends=('mercurial' 'cmake' 'make')
provides=(pep-qt-adapter)
source=("hg+https://pep.foundation/dev/repos/${_name}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_name}"
	
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd "$srcdir/${_name}"
	
	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/${_name}"
	
	make install DESTDIR="$pkgdir"
}

