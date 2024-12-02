# Maintainer: Dennis Herbrich (Gyroplast) <dennis.herbrich@veloxis.de>
# Contributor: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributor: svalo <me@valo.space>
_pkgver="1.12-rc1"
pkgname=plzip
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc="A massively parallel lossless data compressor based on the lzlib compression library"
url="https://www.nongnu.org/lzip/plzip.html"
arch=('x86_64' 'i686')
license=('GPL-2.0-or-later')
depends=('lzlib')
source=("https://download.savannah.gnu.org/releases/lzip/plzip/$pkgname-${_pkgver}.tar.gz")
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz
sha512sums=('0f6d8fe7e7c5e6cc8a6432e4c6f2e15310e84abf098e43c662a00ed3c10c4ea94e6472d2a0a6439a2ee43b972ffddca55b242d58a39375210386ca41d3543373')
build() {
	cd "$pkgname-$_pkgver"
	./configure --prefix=/usr CPPFLAGS="$CPPFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS"
	make
}

check() {
	cd "$pkgname-$_pkgver"
	make -k check
}

package() {
	cd "$pkgname-$_pkgver"
	make DESTDIR="$pkgdir/" install{,-man}
}
