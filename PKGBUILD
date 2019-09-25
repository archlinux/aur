# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetsd-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Virtual SD card directory for the Duet software framework"
arch=('any')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=("duetsd=${pkgver}")
conflicts=("duetsd")
depends=('duetcontrolserver')
optdepends=('duetwebcontrol')
backup=('opt/dsf/sd/sys/config.g')
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetsd_${pkgver}_all.deb")
sha256sums=('cbec47068231af07062ce7db7b996e97da0a80ac8a25e1e21743514429eed812')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}"/opt/dsf/sd/{sys,macros,gcodes,filaments}
	install -m 644 "${srcdir}"/opt/dsf/sd/sys/* "${pkgdir}"/opt/dsf/sd/sys/
	ln -s "/opt/dsf/dwc2" "${pkgdir}/opt/dsf/sd/www"
}
