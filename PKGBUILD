# Maintainer: David Phillips <dbphillipsnz gmail>

_pkgname=farbfeld
pkgname=${_pkgname}-git
pkgver=2.r6.g265ded6
pkgver() {
	cd "${_pkgname}"
	 git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="conversion tools for the suckless image format"
url="http://tools.suckless.org/farbfeld/"
arch=('i686' 'x86_64')
license=('ISC')
depends=('libjpeg-turbo' 'libpng')
makedepends=('git')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("$_pkgname::git+http://git.suckless.org/${_pkgname}")
sha512sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX=/usr DESTDIR=${pkgdir} install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

