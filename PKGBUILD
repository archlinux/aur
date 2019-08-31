# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebserver
pkgver=1.1.0.0
pkgrel=2
pkgdesc="Optional web server for Duet 3 series"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duetwebserver')
conflicts=('duetwebserver')
depends=('duetcontrolserver>=1.0.3.1' 'duetruntime>=1.0.3.1' 'duetwebcontrol' 'duetsd')
options=(!strip staticlibs)
backup=('opt/dsf/conf/http.json')
source=("https://pkg.duet3d.com/dists/unstable/armv7/binary-armhf/duetwebserver_${pkgver}.deb")
sha256sums=('dc0d1a03c6cb0f28d23420e2a0f13cdc876adfa0e5febf22eeecb4c71b004e47')

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
