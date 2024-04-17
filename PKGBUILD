# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=libratp
pkgdesc='User space implementation of the RATP protocol (RFC 916)'
pkgver=0.0.6
pkgrel=2
url=https://github.com/aleksander0m/libratp
license=(LGPL-2.1-only)
arch=(x86_64)
depends=(libevent)
makedepends=(autoconf automake gtk-doc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('ca76ed028e962a39e3ca6e88706a2e28310ed5cd1b00563ef871ae1cab0ed2f32ebcb23c090b5feb1de8bb99b884233b1f31b68d40bb3b897df4bd9462c95e72')

prepare () {
	cd "$pkgname-$pkgver"
	NOCONFIGURE=1 ./autogen.sh
}

build () {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
		--enable-silent-rules \
		--enable-gtk-doc \
		--disable-maintainer-mode \
		--disable-dependency-tracking
	make
}

package () {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}
