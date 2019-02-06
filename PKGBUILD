# Maintainer: X0rg
# Contributor: eloaders <eloaders at linux dot pl>

_pkgname=libcpuid
pkgname=$_pkgname-git
epoch=2
pkgver=0.4.1.r0.ga6123e8
pkgrel=1
pkgdesc="A small C library for x86 CPU detection and feature extraction"
arch=('i686' 'x86_64')
url="http://libcpuid.sourceforge.net"
license=('BSD')
depends=('glibc')
makedepends=('git' 'doxygen')
conflicts=('libcpuid')
provides=('libcpuid')
source=("git+https://github.com/anrieff/libcpuid.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
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
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install

	msg2 "Install license..."
	install -Dvm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
