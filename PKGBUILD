# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=freecalypso-tools
pkgver=r20
pkgrel=1
pkgdesc="FreeCalypso host tools package"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${pkgname}"
license=('custom')
groups=('freecalypso')
conflicts=("${pkgname}-hg")
_tarname=fc-host-tools-${pkgver}
source=("https://www.freecalypso.org/pub/GSM/FreeCalypso/${_tarname}.tar.bz2")
sha256sums=('50185b4b21559581f13c5e840193bc43ccfadeabcd066879006a051883b38444')

build() {
	cd "${_tarname}"
	make
}

package() {
	cd "${_tarname}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	cp -r doc/* "${pkgdir}/usr/share/doc/${pkgname}/"

	# DESTDIR is not respected, use INSTALL_PREFIX instead
	make INSTALL_PREFIX="${pkgdir}/opt/freecalypso/" install
}
