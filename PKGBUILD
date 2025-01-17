# Maintainer: Dennis Herbrich (Gyroplast) <dennis.herbrich@veloxis.de>
# Contributor: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributor: svalo <me@valo.space>

pkgname=plzip
pkgver=1.12
pkgrel=1
pkgdesc="A massively parallel lossless data compressor based on the lzlib compression library"
url="https://www.nongnu.org/lzip/plzip.html"
arch=('x86_64' 'i686')
license=('GPL-2.0-or-later')
depends=('lzlib')
source=("https://download.savannah.gnu.org/releases/lzip/plzip/$pkgname-$pkgver.tar.gz"{,.sig})
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz
sha512sums=('b6fa75e30aba33f98b91683f4dbd2ec274b2c2b881bc31fc1841614d69aa1e5ca70dacf664efeefb3378deecc715a93000a27dc29e0103d7ce205168e81c27ae'
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
