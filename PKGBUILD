# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=stepcode
pkgver=0.8
pkgrel=2
pkgdesc="Data exchange with ISO 10303. Used with IFC, STEP, and other standards
to exchange data wit C++ and Python."
arch=('i686' 'x86_64')
url="https://stepcode.github.io"
license=('BSD 3-Clause')
depends=('gcc')
makedepends=('cmake')
_name=stepcode
source=(https://github.com/stepcode/${_name}/archive/v${pkgver}.tar.gz)
sha256sums=('f9cc8a5a4193f97add595c1909433154f82983b892c532be2a696758b153fd2c')

_buildtype="Release"

build() {
	cd "${srcdir}/${_name}-${pkgver}"

	msg "Starting CMake (build type: ${_buildtype})"

	# Create a build directory
	mkdir -p "${srcdir}/${_name}-${pkgver}/build"
	cd "${srcdir}/${_name}-${pkgver}/build"

	cmake .. \
		-DCMAKE_BUILD_TYPE="${_buildtype}" \
		-DCMAKE_INSTALL_PREFIX="/usr"
    #-DCMAKE_INSTALL_LIBDIR="lib" \

	msg "Building the project"
	make
}

package() {
	cd "${srcdir}/${_name}-${pkgver}/build"

	msg "Installing files"
	make DESTDIR="${pkgdir}/" install

}
