# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=ez100-pcsc-driver
pkgver=1.5.3
pkgrel=1
pkgdesc="EZ100PU/MINI driver for PCSC"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.casauto.com.tw/en/in-download-02.aspx?cid=C_00000024&id=P_00000055"
depends=('pcsclite')
source=("http://www.casauto.com.tw/db/pictures/modules/PDT/PDT060207001/2011810151801402.zip")
sha1sums=('71e711d70a6baa97adee0c011846f3fc17ecbd72')

package() {
	if [ "${CARCH}" = "x86_64" ]; then
		unzip -x EZUSB_Linux/EZUSB_Linux_x86_64_v${pkgver}.zip
		base_dir="EZUSB_Linux_x86_64_v${pkgver}/driver_ezusb_v${pkgver}_for_64_bit"
	else
		unzip -x EZUSB_Linux/EZUSB_Linux_x86_v${pkgver}.zip
		base_dir="EZUSB_Linux_x86_v${pkgver}/driver_ezusb_v${pkgver}"
	fi

	# Prepare the target directory structure
	mkdir -p ${pkgdir}/usr/lib/pcsc/drivers/ifd-ez100.bundle/Contents/Linux

	# Copy everything to the right place
	cp ${base_dir}/drivers/Info.plist ${pkgdir}/usr/lib/pcsc/drivers/ifd-ez100.bundle/Contents/
	cp ${base_dir}/drivers/ezusb.so ${pkgdir}/usr/lib/pcsc/drivers/ifd-ez100.bundle/Contents/Linux/
}
