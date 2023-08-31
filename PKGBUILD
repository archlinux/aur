# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_hgname=fc-sim-tools
_pkgname=freecalypso-sim-tools
pkgname="${_pkgname}-hg"
pkgver=r103.3477438b5706
pkgrel=1
pkgdesc="FreeCalypso SIM card tools"
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

	install -d "${pkgdir}/opt"
	install -d "${pkgdir}/usr/share/doc/${_pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	# DESTDIR is not respected, '/opt/freecalypso' is hard-coded.
	# The project's author is strongly against using any other directory.
	make install
	cp -r /opt/freecalypso "${pkgdir}/opt/"
	cp -r doc/* "${pkgdir}/usr/share/doc/${_pkgname}/"
}
