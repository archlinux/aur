# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetsd-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Virtual SD card directory for the Duet software framework"
arch=('any')
url="https://github.com/Duet3D/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetsd=${pkgver}")
conflicts=("duetsd" "reprapfirmware<=1.1.0.0")
depends=('duetsoftwareframework>=3.2.0')
optdepends=('duetcontrolserver' 'duetwebcontrol')
backup=('opt/dsf/sd/sys/config.g')
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetsd_${pkgver}_all.deb")
md5sums=('171e26a14eaa0179545dd993d69c34c3')
sha1sums=('9ce3397c98f391dec2bb16e0300a41f2f7cfa8ef')
sha256sums=('7475d79df7f8e349445e0422dc6e08322b7416c33d82af343916a30031997fa1')
sha512sums=('7d0fa736ef73ae74161535f249af55691ad8f88bb8848c6622e0597f3c02f4099a643fca0a2edcbd1ce9fc8c38d92f751fa18e4cb6cb8cc22076d6e309672770')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 -o dsf -g dsf "${pkgdir}/opt/dsf/sd/"{filaments,firmware,gcodes,macros,menu,sys}
	install -m  644 -o dsf -g dsf "${srcdir}/opt/dsf/sd/sys/"* "${pkgdir}/opt/dsf/sd/sys/"
	ln -s "/opt/dsf/dwc" "${pkgdir}/opt/dsf/sd/www"
}
