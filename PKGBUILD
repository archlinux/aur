# Maintainer: madmurphy <madmurphy333 AT gmail DOT com>

_libname='relic'
pkgname="${_libname}-git"
pkgver='r3281.edf5bd94'
pkgrel=1
pkgdesc='RELIC is an Efficient Library for Cryptography'
arch=('x86_64' 'i686')
url='https://github.com/relic-toolkit/relic'
license=('GPL')
makedepends=('cmake' 'doxygen')
provides=("${_libname}")
conflicts=("${_libname}" "${_libname}-bin")
source=("git+https://github.com/${_libname}-toolkit/${_libname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_libname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_libname}"
	(cd .. && mkdir "${_libname}-target")
}

build() {
	cd "${srcdir}/${_libname}-target"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../"${_libname}"
	make
}

check() {
	cd "${srcdir}/${_libname}-target"
	ctest
}

package() {
	cd "${srcdir}/${_libname}-target"
	make DESTDIR="${pkgdir}" install
}
