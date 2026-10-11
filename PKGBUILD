# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_hgname=gsm-codec-lib
pkgname="freecalypso-${_hgname}"
pkgver=r5
pkgrel=1
pkgdesc="FreeCalypso GSM codec libraries and utilities"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${_hgname}"
license=('LicenseRef-FreeCalypso')
groups=('freecalypso')
conflicts=("${pkgname}-hg")
_tarname="${_hgname}-${pkgver}"
source=("https://www.freecalypso.org/pub/GSM/codecs/${_tarname}.tar.bz2")
sha256sums=('e69282c361ba2a1398adf268d801e8b12cbf71667eb093d55e49a856324a2ee6')

build() {
	cd "${_tarname}"
	./configure --prefix="/usr" CFLAGS="-std=gnu89 ${CFLAGS}"
	make
}

package() {
	cd "${_tarname}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	cp -r doc/* "${pkgdir}/usr/share/doc/${pkgname}/"

	make DESTDIR=$pkgdir install
}
