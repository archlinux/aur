# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetcontrolserver
pkgver=1.0.3.0
pkgrel=1
pkgdesc="Control server application for Duet 3 series"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duetcontrolserver')
conflicts=('duetcontrolserver')
depends=("duetruntime=${pkgver}")
options=(!strip staticlibs)
backup=('opt/dsf/conf/config.json')
source=("https://chrishamm.io/debian/dists/buster/dsf/binary-armhf/duetcontrolserver_${pkgver}.deb")
sha256sums=('7f64256852238d7becd81b880d2c5cb772b8ff32c4ca7a17b00cfa10aa14418c')

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
