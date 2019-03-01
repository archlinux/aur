# Previous Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Previous Maintainer: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>
# Maintainer: midgard <arch dot midgard "at symbol" janmaes "youknowwhat" com>
pkgname=libdart
pkgver=6.7.3
pkgrel=1
pkgdesc="Dynamic Animation and Robotics Toolkit"
arch=('i686' 'x86_64')
url="https://dartsim.github.io"
license=('BSD')
depends=('assimp' 'boost' 'eigen>=3' 'fcl' 'flann' 'glut' 'libccd' 'libgl'
         'urdfdom' 'octomap')
optdepends=('bullet: Bullet collision detection support'
            'ode: ODE collision detection support'
            'coin-or-ipopt: Ipopt optimizer support'
            'nlopt: NLopt optimizer support'
            'openscenegraph: required for dart-gui-osg')
makedepends=('cmake' 'doxygen')
_name=dart
source=(https://github.com/dartsim/${_name}/archive/v${pkgver}.tar.gz)
sha256sums=('bacee34f6c848f6bf777d2ea0c85d2000f0a831c6f5827d3d6a5b922bc48fcf8')

_buildtype="Release"

build() {
	cd "${srcdir}/${_name}-${pkgver}"

	msg "Starting CMake (build type: ${_buildtype})"

	# Create a build directory
	mkdir -p "${srcdir}/${_name}-${pkgver}-build"
	cd "${srcdir}/${_name}-${pkgver}-build"

	cmake \
		-DCMAKE_BUILD_TYPE="${_buildtype}" \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		"${srcdir}/${_name}-${pkgver}"

	msg "Building the project"
	make
}

check() {
	cd "${srcdir}/${_name}-${pkgver}-build"
	msg "Compiling unit tests"
	make tests
	msg "Running unit tests"
	make test
}

package() {
	cd "${srcdir}/${_name}-${pkgver}-build"

	msg "Installing files"
	make DESTDIR="${pkgdir}/" install
}

# vim: set noet :
