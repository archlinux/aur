# Maintainer: Adrián Pérez de Castro
pkgdesc='Extensible Shell derived from Plan9 rc'
pkgname=es
pkgver=0.9.1
pkgrel=1
arch=(x86_64)
url='http://wryun.github.io/es-shell/'
depends=(readline termcap)
makedepends=(bison)
license=('custom:Public Domain')
install=es.install
source=("https://github.com/wryun/es-shell/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('4dfa2096e14977437e5dea3ac89e65dc08b5abbb0433af711a1759d5f719f82b24fdcc85ff764526aaae627998da4022504bb21fe96adeb3e434f29356f39593')

build () {
	./configure --prefix=/usr --with-readline
	make
}

package () {
	# The included Makefile does NOT honor DESTDIR (or anything like it)
	install -D -m755 es "${pkgdir}/usr/bin/es"
	install -D -m644 doc/es.1 "${pkgdir}/usr/share/man/man1/es.1"

	# Documentation and examples.
	install -D -m644 README "${pkgdir}/usr/share/licenses/${pkgname}/README"
	install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
		doc/ERRATA doc/usenix-w93.ps doc/es-list.gz
	install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}/examples" \
		examples/*
}

check () {
	make trip
}
