# Maintainer: Javier Tia <javier dot tia at gmail dot com>
# Contributer: Giuseppe Calà <jiveaxe@gmail.com>
# Contributer: giacomogiorgianni@gmail.com
# Contributor: TingPing <tingping@tingping.se>

pkgname=aucatctl
pkgver=0.1
pkgrel=1
pkgdesc="Control aucat and/or sndiod volume through MIDI"
arch=('i686' 'x86_64')
url='http://www.sndio.org/'
license=('ISC')
depends=(alsa-lib libbsd sndio)
source=("http://www.sndio.org/${pkgname}-${pkgver}.tar.gz")
sha256sums=('524f2fae47db785234f166551520d9605b9a27551ca438bd807e3509ce246cf0')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	sed -i 's?/usr/local?/usr?g' Makefile
	sed -i 's?man/man1?share/man/man1?g' Makefile
	sed -i 's?LDADD = -lsndio?LDADD = -lbsd\nLDADD += -lsndio?' Makefile

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install

	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	sed '/^ \*\//q' aucatctl.c > ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
