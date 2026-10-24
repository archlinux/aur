# Maintainer: Timothée Andres <andres.timothee+aur@gmail.com>
pkgname=iodeos-installer-bin
_pkgname=${pkgname%%-bin}
pkgver=0.3.1
pkgrel=1
pkgdesc='iodéOS is installable within a few clicks! The installer is available for all official devices.'
arch=('x86_64')
license=(unknown)
depends=(harfbuzz at-spi2-core libgcc pango gdk-pixbuf2 gtk3 glibc libstdc++ zlib cairo glib2)
provides=("${_pkgname}")
conflicts=()
url="https://gitlab.iode.tech/ota/ota"
source=(
    "${_pkgname}-${pkgver}.tgz::${url}/-/raw/master/installer/iodeOS-installer-v${pkgver}-linux.tgz"
    "${_pkgname}-${pkgver}.tgz.sha256::${url}/-/raw/master/installer/iodeOS-installer-v${pkgver}-linux.tgz.sha256"
)
sha256sums=('ea5cb5bc11977bb7e62f894dd3b53f6ca6c5d0d5aa82357beda4a8af29572722'
            '1e5bfe9f2811239ba229b72d2ca5cb7b96be25a8ea9bc3aecc082f98750e2177')

package() {
	cd "${srcdir}/iodeOS-installer"

	install -d -m755 "${pkgdir}/usr/bin"
	install -d -m755 "${pkgdir}/usr/lib/${_pkgname}"
	cp -r data/ lib/ "${pkgdir}/usr/lib/${_pkgname}"
	install -m755 iodeOS-installer "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
	
	cd "${pkgdir}/usr/bin"
	ln -s "../lib/${_pkgname}/${_pkgname}" "${_pkgname}" 
}	
