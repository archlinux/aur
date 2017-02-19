# Maintainer: Michał Lisowski <lisu@riseup.net>

pkgname=exact-image
pkgver=0.9.2
pkgrel=1
pkgdesc="Fast image manipulation programs"
arch=('i686' 'x86_64')
url="http://exactcode.com/opensource/exactimage/"
license=('GPL2')
depends=('agg')
source=("http://dl.exactcode.de/oss/exact-image/$pkgname-$pkgver.tar.bz2"
        "$pkgname-c-98.patch"
        "$pkgname-syntax.patch")
md5sums=('bb9c8be82a4b5126be0224529ea7c4c7'
         '6d006542aad588c07fd88030c556470d'
         'c169fcbfb3cbe5778cff4522f5ce0d83')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-c-98.patch"
	patch -p1 -i "$srcdir/$pkgname-syntax.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
