# Maintainer: Dennis Herbrich (Gyroplast) <dennis.herbrich@veloxis.de>
# Contributor: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributor: svalo <me@valo.space>

pkgname=plzip
pkgver=1.11
pkgrel=1
pkgdesc="A massively parallel lossless data compressor based on the lzlib compression library"
url="https://www.nongnu.org/lzip/plzip.html"
arch=('x86_64' 'i686')
license=('GPL-2.0-or-later')
depends=('lzlib')
source=("https://download.savannah.gnu.org/releases/lzip/plzip/$pkgname-$pkgver.tar.gz"{,.sig})
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz
sha512sums=('3a0f0443e68a6b776d85b69ed24d21e03d7bad1b788d6e8f741cc0ebb2537aebde2d68aa6765bcb4d61df6521779af27d176f5ef348014fa3088aa219d5ec691'
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
