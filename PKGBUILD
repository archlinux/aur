# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: svalo <me@valo.space>

pkgname=plzip
pkgver=1.10
pkgrel=3
pkgdesc="A massively parallel lossless data compressor based on the lzlib compression library"
url="https://www.nongnu.org/lzip/plzip.html"
arch=('x86_64' 'i686')
license=('GPL')
depends=('lzlib')
source=("https://download.savannah.gnu.org/releases/lzip/plzip/$pkgname-$pkgver.tar.gz"{,.sig})
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz
sha512sums=('7fd7ec288800950deaec9337b3112db72cde059721a0143a091650fc20ba2a3d9d7eebbd7a312e5bbb1a61ca6c902d2450e6c3c7172dccf9c0c8b86db7c2a944'
            'SKIP')
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr CPPFLAGS="$CPPFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS"
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
