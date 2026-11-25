# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_hgname=gsm-codec-lib
pkgname="freecalypso-${_hgname}"
pkgver=r6
pkgrel=1
pkgdesc="FreeCalypso GSM codec libraries and utilities"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${_hgname}"
license=('LicenseRef-FreeCalypso')
groups=('freecalypso')
conflicts=("${pkgname}-hg")
_tarname="${_hgname}-${pkgver}"
source=("https://www.freecalypso.org/pub/GSM/codecs/${_tarname}.tar.bz2")
sha256sums=('f948a18d192e6021f43b65c9d6130c75312cb99da49351b7812fba67e9c31515')

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
