# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=ldapxx
pkgdesc="C++ interface to ldap.h"
url="https://github.com/de-vri-es/ldapxx"
pkgver=0.1.4
pkgrel=1
depends=(libldap boost)
arch=(x86_64 i386)
license=(BSD)

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/ldapxx/archive/$pkgver.tar.gz")
sha512sums=('07dad96d9e71cf342576866ebb3078dec6ad5bc80227918890cfec1f964d88af2baec5b5b3ee95e70313862370dd05343f95e411068ed0b10392320b05b1fb4c')

prepare() {
	rm -rf "$srcdir/build"
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=Release
}

build() {
	cd "$srcdir/build"
	make
}

package() {
	cd "$srcdir/build"
	make install DESTDIR="$pkgdir"
	install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/LICENSE"
}
