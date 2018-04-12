# Maintainer: David Phillips <dbphillipsnz gmail>

_pkgname=farbfeld
pkgname=${_pkgname}-git
pkgver=4.r0.gab5e3df
pkgver() {
	cd "${_pkgname}"
	 git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="lossless image format which is easy to parse, pipe and compress"
url="https://tools.suckless.org/farbfeld/"
arch=('i686' 'x86_64')
license=('ISC')
depends=('libjpeg-turbo' 'libpng')
makedepends=('git')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("$_pkgname::git+https://git.suckless.org/${_pkgname}")
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

