# Maintainer: svalo <me@valo.space> 
pkgname=plzip
pkgver=1.9
pkgrel=1
pkgdesc="A massively parallel lossless data compressor based on the lzlib compression library"
arch=('x86_64')
url="http://www.nongnu.org/lzip/plzip.html"
license=('GPL')
depends=('lzlib')
source=(
    "http://download.savannah.gnu.org/releases/lzip/plzip/$pkgname-$pkgver.tar.gz"
    "http://download.savannah.gnu.org/releases/lzip/plzip/$pkgname-$pkgver.tar.gz.sig"
    )
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz
sha512sums=('3bca603ba6337462bde3967e7c7a7e66287f3a71adf8db987429fcdcb06ebbb90b52e666a7f98ac699bc158cbda21a9cce02490131d33fc44171b84ebb3a4a19'
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
	make DESTDIR="$pkgdir/" install
}
