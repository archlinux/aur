# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_hgname=fc-sim-sniff
_pkgname=freecalypso-sim-sniff
pkgname="${_pkgname}-hg"
pkgver=r58.95ed46b5f8f1
pkgrel=2
pkgdesc="FreeCalypso SIM sniffer"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${_hgname}"
license=('custom')
groups=('freecalypso')
depends=()
makedepends=('mercurial')
conflicts=("${_pkgname}")
source=("hg+https://www.freecalypso.org/hg/${_hgname}")
md5sums=('SKIP')

pkgver() {
	cd "${_hgname}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd "${_hgname}"
	make -C sw CFLAGS="-std=gnu89 ${CFLAGS}"
}

package() {
	cd "${_hgname}"

	# TODO: no LICENSE file yet
	#install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -d "${pkgdir}/usr/share/doc/${_pkgname}"
	cp -r doc/* "${pkgdir}/usr/share/doc/${_pkgname}/"

	# DESTDIR is not respected, use INSTALL_PREFIX instead
	make -C sw INSTALL_PREFIX="${pkgdir}/opt/freecalypso/" install
}
