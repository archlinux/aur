# Maintainer: svalo <me@valo.space> 
pkgname=plzip
pkgver=1.8
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
sha512sums=('e8e822f8ae77e06178538b62075fa1c5d9cbc76c78bee7ad595a4637cd4077f53fd9e3fe61ca3fbddaa8b950e739d97527dc8fbecae04de1ac3ef83d0d5f13b4'
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
