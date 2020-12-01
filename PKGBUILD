# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
_pkgname=libyui
pkgname=${_pkgname}-git
pkgver=3.11.0.r36.gfc8a0be
pkgrel=1
pkgdesc="Libyui is a widget abstraction library providing Qt, GTK and ncurses frontends. Originally it was developed for YaST but it can be used in any independent project."
arch=('x86_64')
url="https://github.com/libyui/libyui"
license=('GPLv3')
makedepends=('cmake')
provides=("${_pkgname}")
conflicts=()
epoch=1
source=("${_pkgname}::git+https://github.com/libyui/libyui.git")

sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	make EXTRA_PARAMS=-DLIB_DIR=/usr/lib -f Makefile.cvs
}

package() {
	cd "${srcdir}/${_pkgname}"
	make EXTRA_PARAMS=-DLIB_DIR=/usr/lib PREFIX=/usr DESTDIR="${pkgdir}/" -f Makefile.cvs install
	install -m644 -D "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
