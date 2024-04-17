# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=libratp-barebox
pkgdesc='Remote interface for Barebox over a RATP link'
pkgver=0.0.8
pkgrel=2
url=https://github.com/aleksander0m/libratp-barebox
license=(LGPL-2.1-only)
arch=(x86_64)
depends=(libratp)
makedepends=(autoconf automake gtk-doc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('66908fe45fd76fef2f6aeddf5acf843d68015a90790310956bf37f6f50641a9aa28b2f0c9142917e508234f3de82b39a7d46ce087a2449f7cf0232883a3c46d7')

prepare () {
	cd "$pkgname-$pkgver"
	NOCONFIGURE=1 ./autogen.sh
}

build () {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
		--enable-more-warnings=no \
		--enable-gtk-doc \
		--enable-silent-rules \
		--disable-maintainer-mode \
		--disable-dependency-tracking
	make
}

package () {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}
