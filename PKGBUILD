# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: KingofToasters <dev at sgregoratto dot me>
pkgname=sblg
pkgdesc='simple off-line blog utility'
pkgver=0.5.5
pkgrel=1
url='https://kristaps.bsd.lv/sblg'
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
depends=(expat)
license=(custom:ISC)
arch=(x86_64 i686 armv6h armv7h)
sha512sums=('fb18949985292b8db5fe82736fb25c14c1cb0ee19ff6b8764ad77cf745cfb8712fde74665d1efbca29fb7dfb9d4eb959a974bb30e840af78cf0e5e37a4e3520d')

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
