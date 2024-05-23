# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_pkgname=freecalypso-tools
pkgname="${_pkgname}-hg"
pkgver=r1010.1d144553a5d0
pkgrel=1
pkgdesc="FreeCalypso host tools package"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${_pkgname}"
license=('custom')
groups=('freecalypso')
depends=()
makedepends=('mercurial')
source=("hg+https://www.freecalypso.org/hg/${_pkgname}")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd "${_pkgname}"
	make CFLAGS="-std=gnu89 ${CFLAGS}"
}

package() {
	cd "${_pkgname}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -d "${pkgdir}/usr/share/doc/${_pkgname}"
	cp -r doc/* "${pkgdir}/usr/share/doc/${_pkgname}/"

	# DESTDIR is not respected, use INSTALL_PREFIX instead
	make INSTALL_PREFIX="${pkgdir}/opt/freecalypso/" install
}
