# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='lowdown'
pkgdesc='Markdown translator producing HTML5 and roff documents in the ms and man formats'
pkgver='0.3.2'
pkgrel='1'
license=('custom:BSD')
url='https://kristaps.bsd.lv/lowdown/'
arch=('i686' 'x86_64')
depends=('glibc')
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
sha512sums=('476a72f988f1e85377c9cb83fc7fb9404b52382ef11af1c5312ec58035d3f045f352c9f74e7943991c0ae6cd6296a3558e90c75e9610fb3891dfdebf1d328603')

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
