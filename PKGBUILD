# Previous Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Previous Maintainer: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>
# Previous Maintainer: midgard <arch dot midgard "at symbol" janmaes "youknowwhat" com>
# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=libdart
pkgver=6.8.5
pkgrel=1
pkgdesc="Dynamic Animation and Robotics Toolkit"
arch=('i686' 'x86_64')
url="https://dartsim.github.io"
license=('BSD')
depends=('assimp' 'boost' 'eigen' 'fcl' 'libccd' 'freeglut')
optdepends=('bullet: Bullet collision detection support'
            'coin-or-ipopt: Ipopt optimizer support'
            'doxygen: required for building documentation'
            'flann: planning module support'
            'nlopt: NLopt optimizer support'
            'octomap: voxel grid shape support'
            'ode: ODE collision detection support'
            'openscenegraph: required for dart-gui-osg'
            'pagmo: pagmo optimizer support'
            'tinyxml2: parser support'
            'urdfdom: urdf parser support')
makedepends=('cmake')
_name=dart
source=(https://github.com/dartsim/${_name}/archive/v${pkgver}.tar.gz)
sha256sums=('f0ee1c396758d4b6c77dbb5ada186f1f4bf8de409537f3cee93c66c8c3728cb0')

_buildtype="Release"

build() {
	cd "${srcdir}/${_name}-${pkgver}"

	msg "Starting CMake (build type: ${_buildtype})"

	# Create a build directory
	mkdir -p "${srcdir}/${_name}-${pkgver}/build"
	cd "${srcdir}/${_name}-${pkgver}/build"

	cmake \
		-DCMAKE_BUILD_TYPE="${_buildtype}" \
		-DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    "${srcdir}/${_name}-${pkgver}"

	msg "Building the project"
	make -j4
}

#check() {
#	cd "${srcdir}/${_name}-${pkgver}/build"
#	msg "Compiling unit tests"
#	make -j4 tests
#	msg "Running unit tests"
#	make test
#}

package() {
	cd "${srcdir}/${_name}-${pkgver}/build"

	msg "Installing files"
	make DESTDIR="${pkgdir}/" install

}
