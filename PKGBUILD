# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>
# Contributor: midgard <arch dot midgard "at symbol" janmaes "youknowwhat" com>

pkgname=libdart
pkgver=6.9.1
pkgrel=3
pkgdesc="Dynamic Animation and Robotics Toolkit"
arch=('i686' 'x86_64')
url="https://dartsim.github.io"
license=('BSD')
depends=('assimp' 'boost' 'eigen' 'fcl' 'libccd')
optdepends=('bullet: Bullet collision detection support'
            'coin-or-ipopt: Ipopt optimizer support'
            'flann: planning module support'
            'nlopt: NLopt optimizer support'
            'octomap: voxel grid shape support'
            'ode: ODE collision detection support'
            'openscenegraph: required for dart-gui-osg'
            'pagmo: pagmo optimizer support'
            'tinyxml2: parser support'
            'urdfdom: urdf parser support'
            'freeglut: GLUT GUI support'
            'libxi: GLUT GUI support'
            'libxmu: GLUT GUI support')
makedepends=('cmake')
_name=dart
source=(https://github.com/dartsim/${_name}/archive/v${pkgver}.tar.gz)
sha256sums=('9e2954aaf2d4538a7e4aab5188f1061c3e216c8c0b72483c2d0b9e814525acd1')

_buildtype="Release"

build() {
    cd "${srcdir}/${_name}-${pkgver}"

    msg "Starting CMake (build type: ${_buildtype})"

    # Create a build directory
    mkdir -p "${srcdir}/${_name}-${pkgver}/build"
    cd "${srcdir}/${_name}-${pkgver}/build"

    cmake .. \
        -DCMAKE_BUILD_TYPE="${_buildtype}" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \

    msg "Building the project"
    make
}

#check() {
#	cd "${srcdir}/${_name}-${pkgver}/build"
#	msg "Compiling unit tests"
#	make tests
#	msg "Running unit tests"
#	make test
#}

package() {
    cd "${srcdir}/${_name}-${pkgver}/build"

    msg "Installing files"
    make DESTDIR="${pkgdir}/" install
}
