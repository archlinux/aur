# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: Peter Mayr <petermayr@ymail.com>

pkgname=lunzip
pkgver=1.13
pkgrel=3
pkgdesc="Lunzip is a decompressor for the lzip format written in C."
url="https://www.nongnu.org/lzip/lunzip.html"
arch=('x86_64' 'i686')
license=('GPL')
source=("https://download.savannah.gnu.org/releases/lzip/lunzip/$pkgname-$pkgver.tar.gz"{,.sig})
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz
sha512sums=('67f950883b7062d37601bc16d7d64c07f6c580afbf3c0f61394dd6fb5d41c27214484b1dea7aabd41db06d18162b95b5734674646c4fcc833268cabe8cba91bb'
            'SKIP')
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr CPPFLAGS="$CPPFLAGS" CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install{,-man}
}
