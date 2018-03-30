# Previous Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Maintainer: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>
pkgname=libdart
pkgver=6.4.0
pkgrel=1
pkgdesc="Dynamic Animation and Robotics Toolkit"
arch=('i686' 'x86_64')
url="http://dartsim.github.io"
license=('BSD')
depends=('assimp' 'boost' 'eigen>=3' 'fcl' 'flann' 'glut' 'libccd' 'libgl'
         'urdfdom' 'tinyxml' 'tinyxml2')
optdepends=('bullet: Bullet support'
            'coin-or-ipopt: Ipopt support'
            'nlopt: NLopt support')
makedepends=('cmake' 'doxygen')
_name=dart
source=(https://github.com/dartsim/${_name}/archive/v${pkgver}.tar.gz)
sha256sums=('aa92634c1c97d99966cf16c4a0845792941358c063409fa00c28b4039c961c25')

# Build type
_buildtype="Release"

# Build the project
build() {
  cd "${srcdir}/${_name}-${pkgver}"

  msg "Starting CMake (build type = ${_buildtype})"

  # Create a build directory
  mkdir -p "${srcdir}/${_name}-${pkgver}-build"
  cd "${srcdir}/${_name}-${pkgver}-build"

  # Run CMake in release
  cmake -DCMAKE_BUILD_TYPE="${_buildtype}" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        "${srcdir}/${_name}-${pkgver}"

  # Compile the library
  msg "Building the project"
  make
}

# Create the package
package() {
  # Install in /opt/roboptim
  cd "${srcdir}/${_name}-${pkgver}-build"

  msg "Installing files"
  make DESTDIR="${pkgdir}/" install
}
