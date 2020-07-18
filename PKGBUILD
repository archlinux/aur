# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
_pkgname=scroom
pkgname=${_pkgname}-git
pkgver=0.11.r0.gdab856361
pkgrel=1
pkgdesc="Scroom is a generic viewer for viewing 2D data."
arch=('x86_64')
url="https://github.com/kees-jan/scroom"
license=('LGPL2')
makedepends=('boost')
depends=('gtk2' 'libglade' 'boost-libs')
provides=("${_pkgname}")
conflicts=()
epoch=1
source=("${_pkgname}::git+https://github.com/kees-jan/scroom.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	autoreconf -fi
	./configure
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}/" install
	install -m644 -D "${srcdir}/${_pkgname}/README" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
