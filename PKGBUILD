# Maintainer: svalo <me@valo.space> 
pkgname=plzip
pkgver=1.6
pkgrel=1
pkgdesc="A massively parallel lossless data compressor based on the lzlib compression library"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/lzip/plzip.html"
license=('GPL')
depends=('lzlib')
source=(
    "http://download.savannah.gnu.org/releases/lzip/plzip/$pkgname-$pkgver.tar.gz"
    "http://download.savannah.gnu.org/releases/lzip/plzip/$pkgname-$pkgver.tar.gz.sig"
    )
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz
sha512sums=('14f794e290eb58bcdf1fc5699c08c36f57473e36eeb3920dff519741c4265883f8ee348095a9315562812574c3f5ece7bd7ef4a11fbd955fe2ee54e361900f77'
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
