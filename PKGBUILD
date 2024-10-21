# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: KingofToasters <dev at sgregoratto dot me>
pkgname=sblg
pkgdesc='simple off-line blog utility'
pkgver=0.5.12
pkgrel=1
url=https://kristaps.bsd.lv/sblg
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
depends=(expat)
license=(custom:ISC)
arch=(x86_64 i686 armv6h armv7h aarch64)
sha512sums=('2d88dc59949e818977c6e8b7ee090984571b8813d7fd81fba8e705025c604734828b997bfc72d69164f295e9ad2cee0df633acbbbbe3cfda53be7b3a93f3f903')

build () {
	cd "${pkgname}-${pkgver}"
	./configure PREFIX="/usr" MANDIR="/usr/share/man" LDFLAGS="$LDFLAGS -s"
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" make install
	sed -n 3,15p main.c | cut -c4- > COPYING
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
