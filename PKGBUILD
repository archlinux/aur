# Maintainer: Oswin Krause oswin.krause@di.ku.dk
# Contributor:
pkgname=shark-ml-svn
pkgver=r3515
pkgrel=1
provides=('shark-ml')
conflicts=('shark-ml')
pkgdesc="Shark C++ machine learning library"
arch=('i686' 'x86_64')
url="image.diku.dk/shark"
license=('LGPL3')
depends=('boost>=1.55')
makedepends=('cmake>=2.8' 'svn')
source=('svn+https://svn.code.sf.net/p/shark-project/code/trunk/Shark')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/Shark"
	printf "r%s" "$(svnversion | tr -d 'A-z')"
}

build() {
	cd "$srcdir/Shark"
	cmake "-DCMAKE_INSTALL_PREFIX=/usr/" \
	"-DBUILD_EXAMPLES=OFF" "-DBUILD_TESTING=OFF" \
	"-DBUILD_SHARED_LIBS=ON" \
	"-DENABLE_ATLAS=OFF" .
	make
}

package() {
	cd "$srcdir/Shark"
	make DESTDIR="$pkgdir/" install
}
