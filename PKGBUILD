# Maintainer: Edoardo Signorini <contact at edoars dot me>

pkgname=librandombytes
epoch=
pkgver=20240318
pkgrel=1
pkgdesc="A microlibrary for generating randomness"
url=https://randombytes.cr.yp.to
license=(Unlicense)
arch=(x86_64)
depends=(openssl)
makedepends=(python)
source=(${url}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('fae6fb839096e54ce8abb6dc8ae46ed67b02034474e83cbda088eddd2e584641')

build() {
	cd ${pkgname}-${pkgver}

	./configure --prefix=/usr
	make
}

package() {
	cd ${pkgname}-${pkgver}

	install -Dt "${pkgdir}"/usr/bin -m0755 build/0/package/bin/randombytes-info
	install -Dt "${pkgdir}"/usr/lib -m0644 build/0/package/lib/librandombytes-kernel.so.1
	install -Dt "${pkgdir}"/usr/lib -m0644 build/0/package/lib/librandombytes-openssl.so.1
	ln -s librandombytes-kernel.so.1 "${pkgdir}"/usr/lib/librandombytes-kernel.so
	ln -s librandombytes-openssl.so.1 "${pkgdir}"/usr/lib/librandombytes-openssl.so
	ln -s librandombytes-kernel.so.1 "${pkgdir}"/usr/lib/librandombytes.so.1
	ln -s librandombytes.so.1 "${pkgdir}"/usr/lib/librandombytes.so
	install -Dt "${pkgdir}"/usr/include -m0644 build/0/package/include/randombytes.h
	install -Dt "${pkgdir}"/usr/share/man/man3 build/0/package/man/man3/randombytes.3
	install -Dt "${pkgdir}"/usr/share/man/man1 build/0/package/man/man1/randombytes-info.1
}
