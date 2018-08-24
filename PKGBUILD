# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='lowdown'
pkgdesc='Markdown translator producing HTML5 and roff documents in the ms and man formats'
pkgver='0.4.0'
pkgrel='1'
license=('custom:BSD')
url='https://kristaps.bsd.lv/lowdown/'
arch=('i686' 'x86_64')
depends=(glibc)
makedepends=(libdiff)
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
sha512sums=('8dd482573a74b91f4056ad944ac7749b824cd5ec685da9a2f8000e86ecc8939b7556022fdeace5dd4aa99b87e32ab682dc261749d1a77e62d6a5c4b90eaa4b9e')

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
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
