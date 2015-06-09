# Contributor: Allen Choong <allencch at hotmail dot com>

pkgname=cndrvcups-lb-bin
pkgver=2.90
pkgrel=1
pkgdesc="Canon UFR II/UFR II LT Printer Driver (including Canon imageCLASS MF4720w)"
url="http://support-asia.canon-asia.com/contents/ASIA/EN/0100270810.html"
arch=('i686' 'x86_64')
depends=('libxml2')
replaces=('canon-ufr')
conflicts=('cndrvcups-lb')
[ "$CARCH" = "x86_64" ] && depends=('lib32-libxml2' 'lib32-libcups')
license=('custom')
source=("Linux_UFRII_PrinterDriver_V290_uk_EN.tar.gz::http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwMjcwODEx&cmp=ACB&lang=EN")
sha256sums=("bcc9db26e261d239438aeb15f171b5b0e7fd305abd0729be0e806bb4c039654a")


package() {
	if [ "${CARCH}" = 'x86_64' ]; then
	  dir=64-bit_Driver
	  suffix=amd64
	elif [ "${CARCH}" = 'i686' ]; then
	  dir=32-bit_Driver
	  suffix=i386
	fi
	cd "${srcdir}/Linux_UFRII_PrinterDriver_V${pkgver/./}_uk_EN/${dir}/Debian/"
	ar xv cndrvcups-common_${pkgver}-1_${suffix}.deb
	tar xzf data.tar.gz
	ar xv cndrvcups-ufr2-uk_${pkgver}-1_${suffix}.deb
	tar xzf data.tar.gz
	mv usr etc ${pkgdir}
}
