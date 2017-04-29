# Maintainer: Allen Choong <allencch at hotmail dot com>
# Contributor: Indeed <fengjared at gmail dot com>

pkgname=cndrvcups-lb-bin
pkgver=3.31
pkgrel=1
pkgdesc="Canon UFR II/UFR II LT Printer Driver (including Canon imageCLASS MF4720w)"
url="http://support-asia.canon-asia.com/contents/ASIA/EN/0100270810.html"
arch=('i686' 'x86_64')
depends_i686=('libxml2' 'libcups' 'libpng12')
depends_x86_64=('lib32-libxml2' 'lib32-libcups' 'lib32-libpng12')
replaces=('canon-ufr')
conflicts=('cndrvcups-lb')
license=('custom')
source=("http://gdlp01.c-wss.com/gds/8/0100007658/03/linux-UFRII-drv-v${pkgver/./}-uken.tar.gz")
sha256sums=('c1211cbe27034847284541fcc613b86ccfe99418a6a2cbb4589b99ffe1af4645')

package() {
	if [ "${CARCH}" = 'x86_64' ]; then
	  dir=64-bit_Driver
	  suffix=amd64
	elif [ "${CARCH}" = 'i686' ]; then
	  dir=32-bit_Driver
	  suffix=i386
	fi
	cd "${srcdir}/linux-UFRII-drv-v${pkgver/./}-uken/${dir}/Debian/"
	ar xv cndrvcups-common_3.71-1_${suffix}.deb
	tar xzf data.tar.gz
	ar xv cndrvcups-ufr2-uk_${pkgver}-1_${suffix}.deb
	tar xzf data.tar.gz
	mv usr etc ${pkgdir}
}
