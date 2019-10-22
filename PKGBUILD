# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebserver-bin
pkgver=1.1.2.1
pkgrel=1
pkgdesc="Optional web server for Duet 3 series"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetwebserver=${pkgver}")
conflicts=("duetwebserver")
depends=('duetcontrolserver>=1.1.0.0' 'duetruntime<1.2.0.0')
optdepends=('duetwebcontrol' 'duetsd')
options=(!strip staticlibs)
backup=('opt/dsf/conf/http.json')
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetwebserver_${pkgver}_armhf.deb")
sha256sums=('d51df00952a62f9705a69576445d30de461dfe2ca45e32257e4122b11005e702')

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
