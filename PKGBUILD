# Maintainer: David Phillips <dbphillipsnz gmail>

_pkgname=farbfeld
pkgname=${_pkgname}-git
pkgver=r75.7cf7ba9
pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="conversion tools for the suckless image format"
url="http://suckless.org"
arch=('i686' 'x86_64')
license=('ISC')
depends=('libjpeg-turbo' 'libpng')
makedepends=('git')
provides=(${_pkgname})
conflicts=(${_pkgname})
epoch=1
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

