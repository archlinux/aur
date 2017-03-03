# Maintainer: Allen Choong <allencch at hotmail dot com>

pkgname=cndrvcups-lb-bin
pkgver=3.30
pkgrel=1
pkgdesc="Canon UFR II/UFR II LT Printer Driver (including Canon imageCLASS MF4720w)"
url="http://support-asia.canon-asia.com/contents/ASIA/EN/0100270810.html"
arch=('i686' 'x86_64')
depends_i686=('libxml2' 'libcups')
depends_x86_64=('lib32-libxml2' 'lib32-libcups')
replaces=('canon-ufr')
conflicts=('cndrvcups-lb')
license=('custom')
source=("http://gdlp01.c-wss.com/gds/8/0100002708/15/Linux_UFRII_PrinterDriver_V${pkgver/./}_uk_EN.tar.gz")
sha256sums=('df669767927a8e17faefe72b4a2c259cd944162b5ed046d44dedbbdb943cf756')

package() {
	if [ "${CARCH}" = 'x86_64' ]; then
	  dir=64-bit_Driver
	  suffix=amd64
	elif [ "${CARCH}" = 'i686' ]; then
	  dir=32-bit_Driver
	  suffix=i386
	fi
	cd "${srcdir}/Linux_UFRII_PrinterDriver_V${pkgver/./}_uk_EN/${dir}/Debian/"
	ar xv cndrvcups-common_3.70-1_${suffix}.deb
	tar xzf data.tar.gz
	ar xv cndrvcups-ufr2-uk_${pkgver}-1_${suffix}.deb
	tar xzf data.tar.gz
	mv usr etc ${pkgdir}
}
