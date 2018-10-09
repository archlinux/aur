# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='lowdown'
pkgdesc='Markdown translator producing HTML5 and roff documents in the ms and man formats'
pkgver='0.4.1'
pkgrel='1'
license=('custom:BSD')
url='https://kristaps.bsd.lv/lowdown/'
arch=('i686' 'x86_64')
depends=(glibc)
makedepends=(libdiff)
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9d2c026fa319f7b9f5b2c11b67ec5ec97a70a5cf3560c55545e571c929c3a8253014fa219dc9a78e59472a0c94472d218630f214cf03276a3cb7065c5aa54ef6')

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
