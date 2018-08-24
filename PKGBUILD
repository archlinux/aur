# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=libdiff
pkgdesc='C library to generate arbitrary sequence diffs'
pkgver=0.1.0
pkgrel=2
url='https://github.com/kristapsdz/libdiff'
arch=(x86_64)
depends=(zlib)
license=(custom:MIT)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/VERSION_${pkgver//./_}.tar.gz")
sha512sums=('b5b49914ef7405b225c80a154edda23d2b0149b523449244b748c1f6565132128ff139ef193300b534e6838baeaff8e19ad36baf3f2e293d392ef7a1cd979ca5')

build () {
	cd "${pkgname}-VERSION_${pkgver//./_}"
	./configure PREFIX=/usr MANDIR=/usr/share/man
	cat >> Makefile.configure <<-EOF
	CFLAGS += ${CFLAGS}
	LDFLAGS += ${LDFLAGS}
	EOF
	make
}

package () {
	cd "${pkgname}-VERSION_${pkgver//./_}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
