# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
_pkgname=saait
pkgname=${_pkgname}-git
pkgver=0.7.1.r0.gfd64204
pkgrel=1
pkgdesc="The most boring static page generator"
arch=('x86_64')
url="https://codemadness.org/saait.html"
license=('ISC')
depends=()
provides=("${_pkgname}")
conflicts=()
epoch=1
source=("${_pkgname}::git://git.codemadness.org/saait")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}/" MANPREFIX="/usr/share/man"
}

check() {
	: #Do nothing
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}/" MANPREFIX="/usr/share/man" install
	install -m644 -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
