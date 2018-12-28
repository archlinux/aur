# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=libdiff
pkgdesc='C library to generate arbitrary sequence diffs'
pkgver=0.1.0
pkgrel=4
url='https://github.com/kristapsdz/libdiff'
arch=(x86_64)
makedepends=(glibc)
license=(custom:MIT)
source=("https://kristaps.bsd.lv/${pkgname}/snapshots/${pkgname}-${pkgver}.tar.gz")
sha512sums=('373b3f1a0d6146b2c1ff68d790cd5ba0f38b3a199e96f1da6ceee978e16d27508ea48678e804bcaba435c3c0a4317b01c98f90b3915385edbe73aedab455bbab')

build () {
	cd "${pkgname}-${pkgver}"
	./configure PREFIX=/usr MANDIR=/usr/share/man
	cat >> Makefile.configure <<-EOF
	CFLAGS += ${CFLAGS}
	LDFLAGS += ${LDFLAGS}
	EOF
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
