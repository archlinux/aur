# Maintainer: Benjamin Chretien <chretien dot b +aur at gmail dot com>
pkgname=casadi
pkgver=2.4.2
pkgrel=1
pkgdesc="Symbolic framework for automatic differentiation and numeric optimization"
arch=('i686' 'x86_64')
url="http://casadi.org"
license=('GPL3')
depends=('python2' 'gcc-fortran' 'lapack' 'swig' 'ipython2' 'python2-numpy'
         'python2-scipy' 'python2-matplotlib')
optdepends=('coin-or-ipopt')
makedepends=('cmake')
source=("https://github.com/casadi/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('24e5ddb52e1df132673b2c5e3db55d4564990c08fce9ad72f48d4ba0c4d53e30')

# Build type
_buildtype="Release"

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Create a build directory
  mkdir -p "${srcdir}/${pkgname}-${pkgver}-build"
  cd "${srcdir}/${pkgname}-${pkgver}-build"

  # Run CMake in release
  cmake -DCMAKE_BUILD_TYPE="${_buildtype}" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DWITH_PYTHON=ON \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        "${srcdir}/${pkgname}-${pkgver}"
}

# Build the project
build() {
  cd "${srcdir}/${pkgname}-${pkgver}-build"

  msg2 "Building the project"
  make --silent
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-build"

  msg2 "Installing files"
  make --silent DESTDIR="${pkgdir}/" install
}
