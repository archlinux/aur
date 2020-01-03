# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetsd-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="Virtual SD card directory for the Duet software framework"
arch=('any')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetsd=${pkgver}")
conflicts=("duetsd" "reprapfirmware<=1.1.0.0")
depends=('duetcontrolserver')
optdepends=('duetwebcontrol')
backup=('opt/dsf/sd/sys/config.g')
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetsd_${pkgver}_all.deb")
sha512sums=('8328da81da58dbb3a8d66613aeae0269c5d9f53f99cbefc3c7335c7fd30e2d2c2256297d02c66ce6c27a63bab9d635c2ea34f6a017b6889d168482b095ba9a43')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}"/opt/dsf/sd/{sys,macros,gcodes,filaments}
	install -m 644 "${srcdir}"/opt/dsf/sd/sys/* "${pkgdir}"/opt/dsf/sd/sys/
	ln -s "/opt/dsf/dwc2" "${pkgdir}/opt/dsf/sd/www"
}
