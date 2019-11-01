# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: KingofToasters <dev at sgregoratto dot me>
pkgname=sblg
pkgdesc='simple off-line blog utility'
pkgver=0.5.8
pkgrel=1
url='https://kristaps.bsd.lv/sblg'
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
depends=(expat)
license=(custom:ISC)
arch=(x86_64 i686 armv6h armv7h)
sha512sums=('632aabb6731e512866150dabafa144a2941a91ec490dd86b06dc7390556dc60c910024a2c1af57aac0f6fee9210e0e4311856c7a73273c230671c890fcb8b645')

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
