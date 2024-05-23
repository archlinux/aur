# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_hgname=themwi-ota-tools
_pkgname=freecalypso-ota-tools
pkgname="${_pkgname}-hg"
pkgver=r11.b4b4a822286c
pkgrel=1
pkgdesc="FreeCalypso tools for OTA SIM programming"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${_hgname}"
license=('custom')
groups=('freecalypso')
depends=('openssl')
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
	./configure --prefix="/usr" CFLAGS="-std=gnu89 ${CFLAGS}"
	make
}

package() {
	cd "${_hgname}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	make DESTDIR=$pkgdir install
}
