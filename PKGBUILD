# Contributor: Michał Lisowski <lisu@riseup.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=exact-image
pkgver=1.0.2
pkgrel=2
pkgdesc="Fast image manipulation programs"
arch=('i686' 'x86_64')
url="http://exactcode.com/opensource/exactimage/"
license=('GPL2')
depends=('agg' 'jasper' 'expat' 'giflib' 'libtiff' 'openexr')
source=("http://dl.exactcode.de/oss/exact-image/$pkgname-$pkgver.tar.bz2"
        "$pkgname-c-98.patch"
        "$pkgname-types.patch")
sha256sums=('0694c66be5dec41377acead475de69b3d7ffb42c702402f8b713f8b44cdc2791'
            '28509a0affb04336b16c8a8eddb19962a90f801743b76234e56e7d985df68293'
            '1a1f35db1287981065367f95b1a7e5098ecf53576176ada2653a1dabfa94264d')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir"/$pkgname-c-98.patch
	patch -p1 -i "$srcdir"/$pkgname-types.patch
	sed -i 's+site_perl+5.30/vendor_perl+' api/perl/Makefile
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --without-python --without-php --without-libgif --without-openexr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
