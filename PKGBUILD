# Maintainer: Dennis Herbrich (Gyroplast) <dennis.herbrich@veloxis.de>
# Contributor: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributor: svalo <me@valo.space>

pkgname=plzip
pkgver=1.13
pkgrel=1
pkgdesc="A massively parallel lossless data compressor based on the lzlib compression library"
url="https://www.nongnu.org/lzip/plzip.html"
arch=('x86_64' 'i686')
license=('GPL-2.0-or-later')
depends=('lzlib')
changelog=CHANGELOG.md
source=("https://download.savannah.gnu.org/releases/lzip/plzip/$pkgname-$pkgver.tar.gz"{,.sig})
validpgpkeys=('1E5AEE0B18C0DEB45D64AA0325B62C9821501AA0') # Antonio Diaz Diaz
sha256sums=('64d49dde20daa5fdff2b3ff28e3348082de10dd54eb10df6da7d1bc6c7a6db64'
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
