# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_hgname=gsm-codec-lib
pkgname="freecalypso-${_hgname}"
pkgver=r4
pkgrel=1
pkgdesc="FreeCalypso GSM codec libraries and utilities"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${_hgname}"
license=('LicenseRef-FreeCalypso')
groups=('freecalypso')
conflicts=("${pkgname}-hg")
_tarname="${_hgname}-${pkgver}"
source=("https://www.freecalypso.org/pub/GSM/codecs/${_tarname}.tar.bz2")
sha256sums=('fd0c24a69ad0abaec1efbaa17bee78c1efe0f7d38718c56b018e307ee7cc1b4c')

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
