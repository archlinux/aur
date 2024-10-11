# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_hgname=gsm-codec-lib
_pkgname=freecalypso-gsm-codec-lib
pkgname="${_pkgname}-hg"
pkgver=r556.18aca50d68df
pkgrel=1
pkgdesc="FreeCalypso GSM codec libraries and utilities"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${_hgname}"
license=('LicenseRef-FreeCalypso')
groups=('freecalypso')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
makedepends=('mercurial')
source=("hg+https://www.freecalypso.org/hg/${_hgname}")
md5sums=('SKIP')

pkgver() {
	cd "${_hgname}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd "${_hgname}"
	./configure --prefix="/usr" CFLAGS="-std=gnu89 ${CFLAGS}"
	make
}

package() {
	cd "${_hgname}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -d "${pkgdir}/usr/share/doc/${_pkgname}"
	cp -r doc/* "${pkgdir}/usr/share/doc/${_pkgname}/"

	make DESTDIR=$pkgdir install
}
