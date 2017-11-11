# Contributor: Michał Lisowski <lisu@riseup.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=exact-image
pkgver=0.9.2
pkgrel=4
pkgdesc="Fast image manipulation programs"
arch=('i686' 'x86_64')
url="http://exactcode.com/opensource/exactimage/"
license=('GPL2')
depends=('agg' 'jasper' 'expat' 'giflib' 'libtiff' 'openexr')
makedepends=('gcc6')
source=("http://dl.exactcode.de/oss/exact-image/$pkgname-$pkgver.tar.bz2"
        "$pkgname-c-98.patch"
        "$pkgname-syntax.patch"
        "$pkgname-types.patch")
md5sums=('bb9c8be82a4b5126be0224529ea7c4c7'
         '6d006542aad588c07fd88030c556470d'
         'c169fcbfb3cbe5778cff4522f5ce0d83'
         '31801f23031626f0cb35f6b9d146206e')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-c-98.patch"
	patch -p1 -i "$srcdir/$pkgname-syntax.patch"
	patch -p1 -i "$srcdir/$pkgname-types.patch"
	sed -i 's+site_perl+5.26/vendor_perl+' api/perl/Makefile
}

build() {
	cd "$pkgname-$pkgver"
	CXX=g++-6 ./configure --prefix=/usr --without-python --without-php
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
