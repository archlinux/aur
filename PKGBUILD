# Maintainer: Young Acinonyx <young.acinonyx [at] gmail [dot] com>

pkgname=ezusb
_pkgname=EZUSB_Linux
pkgver=1.5.3
pkgrel=3
pkgdesc="Driver for Castles Technology EZ100PU/EZMINI PC/SC Smart Card Reader."
arch=('x86_64')
url="https://www.castlestech.com/"
license=('unknown')
depends=('pcsclite')
makedepends=('unzip')
source=("${pkgname}-${pkgver}.zip::https://www.castlestech.com/wp-content/uploads/2016/08/201511920271676073.zip")
md5sums=('c4adcc5cb7f34f3a6092b1474c06c513')

prepare() {
	cd "${srcdir}/${_pkgname}/"
	
	# Extract only the 64-bit version of the driver
	unzip -qo ${_pkgname}_x86_64_v${pkgver}.zip

	# Remove unnecessary files and directories
	find "${srcdir}" -type f ! -iname Info.plist ! -iname ezusb.so -delete
	find "${srcdir}" -type d -empty -delete
}

package() {
	install -dm 755 "${pkgdir}/usr/lib/pcsc/drivers/${pkgname}.bundle/Contents/Linux"
	cp -Rfv "${srcdir}/${_pkgname}/${_pkgname}_x86_64_v${pkgver}/driver_${pkgname}_v${pkgver}_for_64_bit/drivers/Info.plist" "${pkgdir}/usr/lib/pcsc/drivers/${pkgname}.bundle/Contents/"
	cp -Rfv "${srcdir}/${_pkgname}/${_pkgname}_x86_64_v${pkgver}/driver_${pkgname}_v${pkgver}_for_64_bit/drivers/${pkgname}.so" "${pkgdir}/usr/lib/pcsc/drivers/${pkgname}.bundle/Contents/Linux"
}
