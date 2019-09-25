# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duettools-bin
pkgver=1.0.4.1
pkgrel=1
pkgdesc="Optional tools (code examples)"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=("duettools=${pkgver}")
conflicts=("duettools")
depends=("duetcontrolserver>=${pkgver}")
options=(!strip staticlibs)
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duettools_${pkgver}_armhf.deb")
sha256sums=('6e7bf7bba47df009cc08e052e248cf9007c10762c738dc240d8eaad412ef1e80')

prepare() {
    tar -xf data.tar.xz
}

package() {

	# DuetControlServer, DuetWebServer, CodeConsole, CodeLogger
	install -dm 755 "${pkgdir}"/{opt/dsf/bin,opt/dsf/conf,usr/bin}
	install "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"

	ln -s "/opt/dsf/bin/CodeConsole" "${pkgdir}/usr/bin/"
	ln -s "/opt/dsf/bin/CodeLogger" "${pkgdir}/usr/bin/"
}
