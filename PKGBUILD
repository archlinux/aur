# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetcontrolserver
pkgver=1.0.3.2
pkgrel=1
pkgdesc="Control server application for Duet 3 series"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duetcontrolserver')
conflicts=('duetcontrolserver')
depends=("duetruntime>=${pkgver}")
options=(!strip staticlibs)
backup=('opt/dsf/conf/config.json')
source=("https://pkg.duet3d.com/dists/unstable/armv7/binary-armhf/duetcontrolserver_${pkgver}.deb")
sha256sums=('e2d6749e40c71a1676db46d7084bcaa30ec2affc99a52230f81ab4656df3432f')

prepare() {
    tar -xf data.tar.xz
}

package() {

	# DuetControlServer, DuetWebServer, CodeConsole, CodeLogger
	install -dm 755 "${pkgdir}"/{opt/dsf/bin,opt/dsf/conf,usr/bin,usr/lib/systemd/system}
	install "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
	install "${srcdir}/usr/lib/systemd/system/"* "${pkgdir}/usr/lib/systemd/system"
	install "${srcdir}/opt/dsf/conf/"* "${pkgdir}/opt/dsf/conf"

	ln -s "/opt/dsf/bin/DuetControlServer" "${pkgdir}/usr/bin/"
}
