# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebserver-bin
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
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetwebserver_${pkgver}.deb")
sha256sums=('ae78d32abacb54087e8c3f6e488e09b982324e23340bf0aabf375c4ab033562a')

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
