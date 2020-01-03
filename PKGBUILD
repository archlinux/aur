# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duettools-bin
pkgver=1.2.2.1
pkgrel=1
pkgdesc="Optional tools (code examples)"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duettools=${pkgver}")
conflicts=("duettools")
depends=("duetcontrolserver>=${pkgver}")
options=(!strip staticlibs)
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duettools_${pkgver}_armhf.deb")
sha512sums=('7acb3b0205bcf6f283e2908a34d1d74d242b9973fd18cac665dda47db97f641c6f418333baf92f0b946532d3512f5161defcf4397e5809380b621962cc49d79c')

prepare() {
    tar -xf data.tar.xz
}

package() {

	# DuetControlServer, DuetWebServer, CodeConsole, CodeLogger
	install -dm 755 "${pkgdir}"/{opt/dsf/bin,opt/dsf/conf,usr/bin}
	install "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"

	ln -s "/opt/dsf/bin/CodeConsole" "${pkgdir}/usr/bin/"
	ln -s "/opt/dsf/bin/CodeLogger" "${pkgdir}/usr/bin/"
	ln -s "/opt/dsf/bin/CustomHttpEndpoint" "${pkgdir}/usr/bin/"
	ln -s "/opt/dsf/bin/ModelObserver" "${pkgdir}/usr/bin/"
}
