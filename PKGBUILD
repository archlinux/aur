# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: KingofToasters <dev at sgregoratto dot me>
pkgname=sblg
pkgdesc='simple off-line blog utility'
pkgver=0.5.11
pkgrel=2
url=https://kristaps.bsd.lv/sblg
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
depends=(expat)
license=(custom:ISC)
arch=(x86_64 i686 armv6h armv7h aarch64)
sha512sums=('2741ce27172d702b2f0165d2fe796896fbc2a08b838e486aa61b9ccfe629ba0a09d5e1e9bbea168425c592bb39ae1cc073e0259772009bad5c7186f64558c93c')

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
