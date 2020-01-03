# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebserver-bin
pkgver=1.2.1.0
pkgrel=1
pkgdesc="Optional web server for Duet 3 series"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetwebserver=${pkgver}")
conflicts=("duetwebserver")
depends=('duetcontrolserver>=1.2.0.0' 'duetruntime>=1.2.0.0')
optdepends=('duetwebcontrol' 'duetsd')
options=(!strip staticlibs)
backup=('opt/dsf/conf/http.json')
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetwebserver_${pkgver}_armhf.deb")
sha512sums=('38213363fbed4a8966e39dfebe722a2f806ba21db67a00d60809880b121110fe427dc340f64ef53a10ae5b4308497112e60088047cd6e7daaa4ace2db2c15743')

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
