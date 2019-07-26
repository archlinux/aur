# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=sisl-git
pkgver=r576.7c28cab
pkgrel=1
pkgdesc="The SINTEF Spline Library - Comprehensive NURBS library"
arch=('i686' 'x86_64')
url="https://www.sintef.no/projectweb/geometry-toolkits/sisl/"
license=('AGPL-3.0')
depends=()
optdepends=()
makedepends=('cmake' 'git')
provides=('sisl')
_name=SISL
source=("git+https://github.com/SINTEF-Geometry/${_name}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

_buildtype="Release"

build() {

	# Create a build directory
	mkdir -p "${srcdir}/${_name}/build"
	cd "${srcdir}/${_name}/build"

	msg "Starting CMake (build type: ${_buildtype})"

	cmake .. \
		-DCMAKE_BUILD_TYPE="${_buildtype}" \
               -DCMAKE_INSTALL_PREFIX="/usr" \
               -DBUILD_SHARED_LIBS=ON

	msg "Building the project"
	make
}

package() {
	cd "${srcdir}/${_name}/build"

	msg "Installing files"
	make DESTDIR="${pkgdir}/" install

}
