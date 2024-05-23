# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_hgname=gsm-codec-lib
pkgname="freecalypso-${_hgname}"
pkgver=r3
pkgrel=1
pkgdesc="FreeCalypso GSM codec libraries and utilities"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${_hgname}"
license=('custom')
groups=('freecalypso')
conflicts=("${pkgname}-hg")
_tarname="${_hgname}-${pkgver}"
source=("https://www.freecalypso.org/pub/GSM/codecs/${_tarname}.tar.bz2")
sha256sums=('f5b9e719b4c715c9d9e3bbbf89c12eacdf6030f357d226cef3ec33a6a123a6ea')

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
