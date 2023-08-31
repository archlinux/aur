# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_hgname=fc-ota-tools
_pkgname=freecalypso-ota-tools
pkgname="${_pkgname}-hg"
pkgver=r9.b6331ae4eea9
pkgrel=2
pkgdesc="FreeCalypso tools for OTA SIM programming"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${_hgname}"
license=('custom')
groups=('freecalypso')
depends=()
makedepends=('mercurial')
source=("hg+https://www.freecalypso.org/hg/${_hgname}")
md5sums=('SKIP')

pkgver() {
	cd "${_hgname}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd "${_hgname}"
	make
}

package() {
	cd "${_hgname}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	# DESTDIR is not respected, use INSTBIN instead (there is no INSTALL_PREFIX!)
	make INSTBIN="${pkgdir}/opt/freecalypso/bin" install
}
