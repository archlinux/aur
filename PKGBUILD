# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=produceit
pkgver=1.0.7
pkgrel=2
epoch=
pkgdesc="cross-distro chroot based Linux package build environment"
url="https://codeberg.org/dyfet/$pkgname"
arch=(x86_64 aarch64)
license=('GPL')
source=($pkgname-v$pkgver.tar.gz::https://codeberg.org/dyfet/$pkgname/archive/v$pkgver.tar.gz)
makedepends=(cmake pkgconf gcc)
sha256sums=('e20e5f382fffc9d41e2092e54caebb73452483a14e3e06fac55913b4a808c0fd')

build() {
	cd "$srcdir/$pkgname"
	cmake \
		-DCMAKE_INSTALL_FULL_SYSCONFDIR:PATH=/etc \
		-DCMAKE_INSTALL_FULL_LOCALSTATEDIR:PATH=/var \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd "$srcdir/$pkgname"
	DESTDIR="$pkgdir/" make install
	strip "$pkgdir"/usr/bin/*it
	chmod +s "$pkgdir"/usr/bin/*it
	strip "$pkgdir"/usr/bin/lxc*
	chmod +s "$pkgdir"/usr/bin/lxc*
	gzip "$pkgdir"/usr/share/man/man*/*
}


