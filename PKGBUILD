# Maintainer: Young Acinonyx <young.acinonyx [at] gmail [dot] com>

pkgname=lib32-ezusb
_pkgname=EZUSB_Linux
pkgver=1.5.3
pkgrel=2
pkgdesc="Driver for Castles Technology EZ100PU/EZMINI PC/SC Smart Card Reader. (32-bit)"
arch=('x86_64')
url="https://www.castlestech.com/"
license=('unknown')
depends=('lib32-pcsclite')
makedepends=('unzip')
source=("${pkgname}-${pkgver}.zip::https://www.castlestech.com/wp-content/uploads/2016/08/201511920271676073.zip")
md5sums=('c4adcc5cb7f34f3a6092b1474c06c513')

prepare() {
	cd "${srcdir}/${_pkgname}/"
	
	# Extract only the 32-bit version of the driver
	unzip -qo ${_pkgname}_x86_v${pkgver}.zip

	# Remove unnecessary files and directories
	find "${srcdir}" -type f ! -iname Info.plist ! -iname ezusb.so -delete
	find "${srcdir}" -type d -empty -delete
}

package() {
	install -dm 755 "${pkgdir}/usr/lib32/pcsc/drivers/${pkgname##lib32-}.bundle/Contents/Linux"
	cp -Rfv "${srcdir}/${_pkgname}/${_pkgname}_x86_v${pkgver}/driver_${pkgname##lib32-}_v${pkgver}/drivers/Info.plist" "${pkgdir}/usr/lib32/pcsc/drivers/${pkgname##lib32-}.bundle/Contents/"
	cp -Rfv "${srcdir}/${_pkgname}/${_pkgname}_x86_v${pkgver}/driver_${pkgname##lib32-}_v${pkgver}/drivers/${pkgname##lib32-}.so" "${pkgdir}/usr/lib32/pcsc/drivers/${pkgname##lib32-}.bundle/Contents/Linux"
}
