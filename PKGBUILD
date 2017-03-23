pkgname=ldapxx
pkgdesc="C++ interface to ldap.h"
pkgver=0.1.0
pkgrel=1
depends=(libldap)
arch=(x86_64 i386)

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/ldapxx/archive/0.1.0.tar.gz")
sha512sums=('3265e4dd2b21329f891105c9f7cc38bca6c80f6b7383e2ef1a0967a885a947289a3a69fca31008dec93643c127528b8d279efb3fb3a5386c2f14cecb7ebb4268')



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

