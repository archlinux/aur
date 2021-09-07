# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_libname='libpabc'
pkgname="${_libname}-git"
pkgver='r6.46eabbb'
pkgrel=1
pkgdesc='C implementation of BBS+ blind signatures using BLS12-381'
arch=('i686' 'x86_64')
url="https://github.com/Fraunhofer-AISEC/${_libname}"
license=('Apache')
provides=("${_libname}")
conflicts=("${_libname}" "${_libname}-bin")
depends=('doxygen' 'libb64' 'gmp' 'jansson' 'relic')
makedepends=('cmake')
source=("git+https://github.com/Fraunhofer-AISEC/${_libname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_libname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_libname}"
	(cd .. && mkdir "${_libname}-build")
}

build() {
	cd "${srcdir}/${_libname}-build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../"${_libname}"
	make
}

check() {
	cd "${srcdir}/${_libname}-build"
	make check
}

package() {
	cd "${srcdir}/${_libname}-build"
	make DESTDIR="${pkgdir}" install
}

