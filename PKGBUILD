# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetcontrolserver
pkgver=1.0.2.1
pkgrel=1
pkgdesc="Control server application for Duet 3 series"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duetcontrolserver')
conflicts=('duetcontrolserver')
depends=('duetruntime=1.0.2.1' 'wiringpi')
options=(!strip staticlibs)
backup=('opt/dsf/conf/config.json')
source=("https://chrishamm.io/debian/dists/stretch/dsf/binary-armhf/duetcontrolserver_${pkgver}.deb")
sha256sums=('0de0fe3cd440104e84559a63bcdb9b0a4f09f38508239a7796509c232036bdf0')

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
