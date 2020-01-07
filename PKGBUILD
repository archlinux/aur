# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetcontrolserver-bin
pkgver=1.2.3.0
pkgrel=1
pkgdesc="Control server application for Duet 3 series"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetcontrolserver=${pkgver}")
conflicts=("duetcontrolserver")
depends=("duetruntime>=${pkgver}" 'linux>=4.8')
options=(!strip staticlibs)
backup=('opt/dsf/conf/config.json')
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetcontrolserver_${pkgver}_armhf.deb")
md5sums=('f8ebde979f8c6c423c4f78470dc43b2f')
sha1sums=('67d0dd82437e7b8e2bc25c9bd6fe9e4f7847f636')
sha256sums=('36c136301a09b2c586d2aaebc8c3b1e3b35899d247f6c7e012d7d4af01fd3fc0')
sha512sums=('648d9516f30fac0fb45f46c1cf7cf56ced27f39370970257bb3c62257216701879a746925d81e78d3685f8418854133d11d5f8fb3b4adf695f040ef1329d5683')

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
