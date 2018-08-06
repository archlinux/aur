# Contributor: Michał Lisowski <lisu@riseup.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=exact-image
pkgver=1.0.1
pkgrel=2
pkgdesc="Fast image manipulation programs"
arch=('i686' 'x86_64')
url="http://exactcode.com/opensource/exactimage/"
license=('GPL2')
depends=('agg' 'jasper' 'expat' 'giflib' 'libtiff' 'openexr')
source=("http://dl.exactcode.de/oss/exact-image/$pkgname-$pkgver.tar.bz2"
        "$pkgname-c-98.patch"
        "$pkgname-types.patch")
md5sums=('1f03ef559ca81cf7a1651a72fd9fe98f'
         '6d006542aad588c07fd88030c556470d'
         '31801f23031626f0cb35f6b9d146206e')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-c-98.patch"
	patch -p1 -i "$srcdir/$pkgname-types.patch"
	sed -i 's+site_perl+5.28/vendor_perl+' api/perl/Makefile
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --without-python --without-php
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
