# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=freecalypso-usbser-tools
pkgver=r1
pkgrel=1
pkgdesc="FreeCalypso USB-serial tools"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${pkgname}"
license=('custom')
groups=('freecalypso')
conflicts=("${pkgname}-hg")
depends=('libusb-compat')
_tarname=fc-usbser-tools-${pkgver}
source=("https://www.freecalypso.org/pub/GSM/FreeCalypso/${_tarname}.tar.bz2")
sha256sums=('9df1ab84340c42f4485db10743d228997e631c8f4225d793cca511efa8d87346')

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
