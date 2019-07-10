# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebserver
pkgver=1.0.0.3
pkgrel=1
pkgdesc="Optional web server for Duet 3 series"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duetwebserver')
conflicts=('duetwebserver')
depends=('duetcontrolserver' 'duetwebcontrol' 'duetsd')
options=(!strip staticlibs)
backup=('opt/dsf/conf/http.json')
source=('https://chrishamm.io/debian/dists/stretch/dsf/binary-armhf/duetwebserver_1.0.0.3.deb')
sha256sums=('60f47b76258eed003e96e833dac04d4eb75fcdd4e0f5feb7485cd3d5c9438281')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/{opt/dsf/bin,opt/dsf/conf,usr/bin,usr/lib/systemd/system}
	install "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
	ln -s "/opt/dsf/bin/DuetWebServer" "${pkgdir}/usr/bin/"
	install -m 644 "${srcdir}/usr/lib/systemd/system/"* "${pkgdir}/usr/lib/systemd/system"
	install -m 644 "${srcdir}/opt/dsf/conf/"* "${pkgdir}/opt/dsf/conf"
}
