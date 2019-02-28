# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=lowdown
pkgdesc='Markdown translator producing HTML5 and roff documents in the ms and man formats'
pkgver=0.4.2
pkgrel=1
license=(custom:BSD)
url='https://kristaps.bsd.lv/lowdown/'
arch=(i686 x86_64)
depends=(glibc)
makedepends=(libdiff)
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c9234c4013a12a5d9aeaa52210afd2e1df9ce2aa44ab0e25e8c7d95c08ae601728859e153f99fff2c9eaa50ff2ed374e07c4f39fa2afb0c9560cd3c1a9dde75a')

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
