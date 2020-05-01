# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

_name=libpEpAdapter
_pkgname=libpep-adapter
pkgname=$_pkgname-hg
pkgver=r170.f9c2f940a09b
pkgrel=2
pkgdesc="C++ library for common structures used in p≡p adapters"
arch=('x86_64' 'i686')
url='https://pep.foundation/dev/repos/libpEpAdapter'
license=('GPL3')
makedepends=('mercurial' 'make' 'pep-engine')
depends=('pep-engine')
provides=('libpep-adapter')
source=("hg+https://pep.foundation/dev/repos/libpEpAdapter")
md5sums=('SKIP')

prepare() {	
	cd "$srcdir/$_name"

	echo "PREFIX=$pkgdir/usr" > 'local.conf'
	echo "ENGINE_LIB=-L/usr/lib" >> 'local.conf'
    echo "ENGINE_INC=-I/usr/include" >> 'local.conf'
}

pkgver() {
	cd "$srcdir/$_name"

	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd "$srcdir/$_name"

	make lib
}

package() {
	cd "$srcdir/$_name"
	
	make install
}

