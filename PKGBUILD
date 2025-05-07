# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>
pkgname=singular-factory
pkgver=4.4.0
pkgrel=1
pkgdesc="Computer Algebra System for polynomial computations: factory and libfac"
arch=('i686' 'x86_64')
url="http://www.singular.uni-kl.de/"
license=('GPL')
depends=('gmp' 'ncurses' 'readline' 'flint')
options=('!strip')
source=(https://www.singular.uni-kl.de/ftp/pub/Math/Singular/Factory/factory-$pkgver.tar.gz)

build() {
	cd "$srcdir"/factory-$pkgver

        autoreconf -vfi
        cp cf_assert.h include/factory/
	CXXFLAGS="-include string.h" ./configure --prefix=/usr \
		    --libdir=/usr/lib \
		    --includedir=/usr/include/singular \
		    --with-ntl \
		    --with-gmp \
		    --disable-omalloc \
		    --without-Singular

	make
}

package() {
	cd "$srcdir"/factory-$pkgver
	make DESTDIR="$pkgdir" install
}

sha256sums=('baf31159578463e26bf18ec68ec901228d79a819866dd96c02d85c73dfbaf030')
