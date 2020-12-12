# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
_pkgname=thrill
pkgname=${_pkgname}-git
pkgver=12c5b59bc
pkgrel=1
pkgdesc="Thrill is an EXPERIMENTAL C++ framework for algorithmic distributed Big Data batch computations on a cluster of machines."
arch=('x86_64')
url="https://github.com/thrill/thrill"
license=('BSD')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
epoch=1
source=("${_pkgname}::git+https://github.com/thrill/thrill.git")

sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p build
	cd build
	cmake -DTHRILL_BUILD_TESTS=OFF ..
}

package() {
	cd "${srcdir}/${_pkgname}/build"
	make PREFIX=/usr DESTDIR="${pkgdir}/" install
	install -m644 -D "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m644 -D "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
