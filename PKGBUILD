# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=ldapxx
pkgdesc="C++ interface to ldap.h"
url="https://github.com/de-vri-es/ldapxx"
pkgver=0.1.3
pkgrel=1
depends=(libldap boost)
arch=(x86_64 i386)
license=(BSD)

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/ldapxx/archive/$pkgver.tar.gz")
sha512sums=('cfe11d8f4d00d6fe9a461329145b435454cd6c507192a5c2bb06ca0ac1fded8301d6c3773d8e75c8b170b96533cce6266be93bd7a9eedab8b33a6bc00a5400bc')



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

