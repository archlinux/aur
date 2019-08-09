# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebserver
pkgver=1.1.0.0
pkgrel=1
pkgdesc="Optional web server for Duet 3 series"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duetwebserver')
conflicts=('duetwebserver')
depends=('duetcontrolserver>=1.0.3.1' 'duetruntime>=1.0.3.1' 'duetwebcontrol' 'duetsd')
options=(!strip staticlibs)
backup=('opt/dsf/conf/http.json')
source=("https://chrishamm.io/debian/dists/buster/dsf/binary-armhf/duetwebserver_${pkgver}.deb")
sha256sums=('3de9a128bb796e2b6dba263272b272b3ec416545f1b1b6859f9bb4129db5335f')

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
