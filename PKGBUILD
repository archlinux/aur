# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=ldapxx
pkgdesc="C++ interface to ldap.h"
url="https://github.com/de-vri-es/ldapxx"
pkgver=0.1.5
pkgrel=1
depends=(libldap boost)
arch=(x86_64 i386)
license=(BSD)

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/ldapxx/archive/$pkgver.tar.gz")
sha512sums=('c73e9357a97c24996b814fa25e1dc65b7e098ce947568550a73082ca744e4611f285ed0739e19dac31377d9ccc850682f1af8efcbd04078ea98604864ebdae5a')

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
