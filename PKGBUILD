# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=pinktrace-1
pkgdesc='Lightweight ptrace() wrapper library'
pkgver=1.0.0
pkgrel=2
license=(custom:BSD)
depends=(glibc)
makedepends=(python)
url=https://pinktrace.exherbo.org/
source=("https://dev.exherbo.org/distfiles/pinktrace/pinktrace-${pkgver}.tar.bz2")
arch=(x86_64)
sha512sums=('35a3071902d1e7bfaaec2880c6d1fd8ecd085d9fea6b455e1b193da808a52cb16c54bdac38af69760bb16847c0d03530e04c9e3fae055fd8f719d8bced977cd9')

build () {
	cd "pinktrace-${pkgver}"
	./configure --prefix=/usr --enable-python
	make
}

check () {
	make -C "pinktrace-${pkgver}" check
}

package () {
	cd "pinktrace-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
