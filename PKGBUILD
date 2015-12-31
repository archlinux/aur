# Maintainer: AsamK <asmak ät gmx de>

pkgname=textsecure-cli
pkgver=0.2.0
pkgrel=1
pkgdesc="textsecure-cli provides a commandline and dbus interface for secure Signal/TextSecure messaging."
arch=('i686' 'x86_64' 'armv6h' 'armv7')
url="https://github.com/AsamK/textsecure-cli"
license=('GPLv3')
depends=('java-runtime' 'libmatthew-unix-java')
makedepends=('java-environment' 'gradle')
source=( "https://github.com/AsamK/${pkgname}/archive/v${pkgver}.tar.gz" )
sha256sums=('5d3ab4926dbe1fe47ef0bfe0fc4efb266be0ea243d430775e9e467033c628bd3')

build() {
	cd "${srcdir}"

	cd "${pkgname}-${pkgver}"

	gradle installDist
}

package() {
	install -m755 -d "${pkgdir}/opt/${pkgname}/"{bin,lib} "${pkgdir}/usr/bin"

	cd "${srcdir}"

	cd "${pkgname}-${pkgver}/build/install/${pkgname}"

	ln -sf "/opt/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -m 755 "bin/${pkgname}" "${pkgdir}/opt/${pkgname}/bin/${pkgname}"

	install -m 644 lib/*.jar "${pkgdir}/opt/${pkgname}/lib/"
}
