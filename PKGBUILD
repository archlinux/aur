pkgname=ldapxx
pkgdesc="C++ interface to ldap.h"
pkgver=0.1.1
pkgrel=1
depends=(libldap)
arch=(x86_64 i386)

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/ldapxx/archive/$pkgver.tar.gz")
sha512sums=('e58c7d74203393ca98ce4cd2ec298d08226218071148fb1f91509532e2a513d7f066f3ffde2ef3bd260172f5145af034be89b308764d69c6834886450e3f3a06')



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
}

