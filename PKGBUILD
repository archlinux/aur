# Maintainer: svalo <me@valo.space> 
pkgname=plzip
pkgver=1.7
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
sha512sums=('6c9817ee89fb01aa20a051970c0d737f0658cbe18b6d6bef44768a53daa695691f5f768e810ba4a477598b435ce097c101685ddd61a8a61022b4343e238eb68f'
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
