# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

_name=libpEpAdapter
_pkgname=libpep-adapter
pkgname=$_pkgname-git
pkgver=2.1.19
pkgrel=1
pkgdesc="C++ library for common structures used in p≡p adapters"
arch=('x86_64' 'i686')
url='https://gitea.pep.foundation/pEp.foundation/libpEpAdapter'
license=('GPL3')
makedepends=('git' 'make' 'pep-engine')
depends=('pep-engine')
provides=('libpep-adapter')
source=("git+https://gitea.pep.foundation/pEp.foundation/libpEpAdapter.git")
md5sums=('SKIP')

prepare() {	
	cd "$srcdir/$_name"

	echo "PREFIX=$pkgdir/usr" > 'local.conf'
	echo "ENGINE_LIB=-L/usr/lib" >> 'local.conf'
    echo "ENGINE_INC=-I/usr/include" >> 'local.conf'
}

pkgver() {
	cd "$srcdir/$_name"

	git tag | grep "^Release" | grep -v RC | sort -V -r | head -1 | tr '_-' ' ' | awk '{print $2}'
}

build() {
	cd "$srcdir/$_name"

	make
}

package() {
	cd "$srcdir/$_name"
	
	make install
}

