# Maintainer: nemesys <nemstar zoho com>
# Contributor: Michał Lisowski <lisu@riseup.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=exact-image
pkgver=1.0.2
pkgrel=4
pkgdesc="Fast image manipulation programs"
arch=('i686' 'x86_64')
url="http://exactcode.com/opensource/exactimage/"
license=('GPL2')
depends=('agg' 'jasper' 'expat' 'libtiff')
source=("http://dl.exactcode.de/oss/exact-image/$pkgname-$pkgver.tar.bz2"
        "$pkgname-$pkgver.patch")
sha256sums=('0694c66be5dec41377acead475de69b3d7ffb42c702402f8b713f8b44cdc2791'
            '0fd1f388c5d947df9bf71cfc822de2f3b25121dfe76dced1af89253df93df3b9')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir"/$pkgname-$pkgver.patch
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
