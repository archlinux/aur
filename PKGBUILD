# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
_pkgname=libcaption
pkgname=${_pkgname}-git
pkgver=e8b6261
pkgrel=1
pkgdesc="Free open-source CEA608 / CEA708 closed-caption encoder/decoder "
arch=('x86_64')
url="https://github.com/szatmary/libcaption"
license=('MIT')
depends=()
makedepends=('cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
epoch=1
source=("${_pkgname}::git+https://github.com/szatmary/libcaption.git")

sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p build
	cd build
	cmake ..
}

build() {
	cd "${srcdir}/${_pkgname}"
	cd build
	cmake --build .
}

package() {
	cd "${srcdir}/${_pkgname}"
	(cd build && make PREFIX=/usr DESTDIR="${pkgdir}/" install)
	install -m644 -D "${srcdir}/${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m644 -D "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
