# Maintainer: X0rg

pkgname=libcpuid
pkgver=0.4.1
pkgrel=1
pkgdesc="A small C library for x86 CPU detection and feature extraction"
arch=('i686' 'x86_64')
url="http://libcpuid.sourceforge.net"
license=('BSD')
depends=('glibc')
makedepends=('git' 'doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/anrieff/libcpuid/archive/v$pkgver.tar.gz")
sha512sums=('2644d6f6c12f7290f2b562726fa66becb77f0ebcc415bac41458513b9f1b5b5a9afdaa5e68a6766b7fe3d7e242ada3c42ecae61ff111dc1f118e56a4edc3abb2')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	msg2 "Run 'libtoolize'..."
	libtoolize

	msg2 "Run 'autoreconf --install'..."
	autoreconf --install

	msg2 "Run './configure'..."
	./configure --prefix=/usr

	msg2 "Run 'make'..."
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install

	msg2 "Install license..."
	install -Dvm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
