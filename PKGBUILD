# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>

pkgname='rastertoezpl'
pkgver=1.1.4
pkgrel=1
pkgdesc='CUPS driver for GODEX printers'
arch=('i686' 'x86_64')
depends=('cups')
url="http://www.godexintl.com"
license=('custom')
source_i686=("rastertoezpl-i686-${pkgver}.tar.gz::https://godex.s3-accelerate.amazonaws.com/Y,WSe2fgwzUgB,SSXAw_jw.file?v01")
source_x86_64=("rastertoezpl-x86_64-${pkgver}.tar.gz::https://godex.s3-accelerate.amazonaws.com/VQzwWnstvY7Mllo24tPuEw.file?v01")
md5sums_i686=('70d008319d571883925031c1a81bb60f')
md5sums_x86_64=('6cf78da6f4d9a3619778016beee73c7b')

package() {

	if [ "$CARCH" = "i686" ] ; then
		_srcdir="GoDEXdriver-${pkgver}(x86)"
	elif [ "$CARCH" = "x86_64" ] ; then
		_srcdir="GoDEXdriver-${pkgver}(x64)"
	else
		echo "Arch not supported: $CARCH"
		exit 1
	fi

	cd "${srcdir}/${_srcdir}"

	mkdir -p ${pkgdir}/usr/lib/cups/filter/
	cp rastertoezpl ${pkgdir}/usr/lib/cups/filter/

	mkdir -p ${pkgdir}/usr/share/ppd/godex/
	cp ppd/*.ppd ${pkgdir}/usr/share/ppd/godex/

	mkdir -p ${pkgdir}/usr/share/doc/rastertoezpl/
	cp ChangeLog ${pkgdir}/usr/share/doc/rastertoezpl/

	mkdir -p ${pkgdir}/usr/share/cups/usb/
	echo "# GoDEX Printer:" > ${pkgdir}/usr/share/cups/usb/godex
	echo "0x195f 0x0001 unidir no-reattach" >> ${pkgdir}/usr/share/cups/usb/godex
}
