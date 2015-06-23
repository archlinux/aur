# Maintainer: Allen Choong <allencch at hotmail dot com>

pkgname=cndrvcups-lb-bin
pkgver=3.00
pkgrel=1
pkgdesc="Canon UFR II/UFR II LT Printer Driver (including Canon imageCLASS MF4720w)"
url="http://support-asia.canon-asia.com/contents/ASIA/EN/0100270810.html"
arch=('i686' 'x86_64')
depends_x86_64=('libxml2')
depends_i686=('lib32-libxml2' 'lib32-libcups')
replaces=('canon-ufr')
conflicts=('cndrvcups-lb')
license=('custom')
source=("http://gdlp01.c-wss.com/gds/8/0100002708/12/Linux_UFRII_PrinterDriver_V${pkgver/./}_uk_EN.tar.gz")
sha256sums=('3d4210670e5844d118c5350643b046e9126726eadca4d0f5d2b9c904133e956d')


package() {
	if [ "${CARCH}" = 'x86_64' ]; then
	  dir=64-bit_Driver
	  suffix=amd64
	elif [ "${CARCH}" = 'i686' ]; then
	  dir=32-bit_Driver
	  suffix=i386
	fi
	cd "${srcdir}/Linux_UFRII_PrinterDriver_V${pkgver/./}_uk_EN/${dir}/Debian/"
	ar xv cndrvcups-common_${pkgver/00/10}-1_${suffix}.deb
	tar xzf data.tar.gz
	ar xv cndrvcups-ufr2-uk_${pkgver}-1_${suffix}.deb
	tar xzf data.tar.gz
	mv usr etc ${pkgdir}
}
