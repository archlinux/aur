# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_hgname=sms-coding-utils
_pkgname=freecalypso-sms-coding-utils
pkgname="${_pkgname}-hg"
pkgver=r25.2a19b44c272e
pkgrel=1
pkgdesc="FreeCalypso SMS encoding utilities"
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
	./configure --prefix="/usr" CFLAGS="-std=gnu89 ${CFLAGS}"
	make
}

package() {
	cd "${_hgname}"

	# XXX: install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -d "${pkgdir}/usr/share/doc/${_pkgname}"
	cp -r doc/* "${pkgdir}/usr/share/doc/${_pkgname}/"

	make DESTDIR=$pkgdir install
}
