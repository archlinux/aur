# Maintainer: David Phillips <dbphillipsnz gmail>

_pkgname=farbfeld
pkgname=${_pkgname}-git
pkgver=1
pkgver() {
	cd ${_pkgname}
	git describe --tags |sed 's/-/./g'
}
pkgrel=2
pkgdesc="conversion tools for the suckless image format"
url="http://suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
depends=()
makedepends=('git')
provides=(${_pkgname})
conflicts=(${_pkgname})
epoch=1
source=("$_pkgname::git+http://git.suckless.org/${_pkgname}")
sha512sums=('SKIP')

prepare() {
	cd "${srcdir}/${_pkgname}"
	if [ -f "${srcdir}/config.h" ]; then
		msg "Using user-provided config.h"
		cp "${srcdir}/config.h" ./
	fi
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX=/usr DESTDIR=$pkgdir install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

