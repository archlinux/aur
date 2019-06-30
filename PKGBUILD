# Previous Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>
# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=omplapp
pkgver=1.4.2
pkgrel=4
pkgdesc="The Open Motion Planning Library App (OMPL.app) is an extended version
of OMPL that adds support for mesh loading and collision checking along with a
GUI"
arch=('i686' 'x86_64')
url="http://ompl.kavrakilab.org/"
license=('BSD')
depends=('assimp'
         'boost'
         'doxygen'
         'eigen'
         'fcl')
optdepends=('castxml'
            'flann'
            'graphviz'
            'libccd'
            'morse-simulator'
            'ode'
            'pqp'
            'py++'
            'pygccxml'
            'pypy'
            'python'
            'python-celery'
            'python-flask'
            'python-numpy'
            'python-opengl'
            'python-pyqt5'
            'spot'
            'triangle')
makedepends=('cmake')
provides=('ompl')
source=(https://bitbucket.org/ompl/ompl/downloads/omplapp-${pkgver}-Source.tar.gz)
sha512sums=('04812a659fd81c2c541907911cbf4e5987be034546e8e48ed3d11b2b2f9ad3f7931f15d30a32ce3b64deb66b13875970797ac5072e92bfa0841e8d27d85fcb18')

_buildtype="Release"

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  msg "Starting CMake (build type: ${_buildtype})"

  # Create a build directory
  mkdir -p "${srcdir}/${pkgname}-${pkgver}-Source/build"
  cd "${srcdir}/${pkgname}-${pkgver}-Source/build"

  cmake \
    -DCMAKE_BUILD_TYPE="${_buildtype}" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DOMPL_REGISTRATION=Off \
    "${srcdir}/${pkgname}-${pkgver}-Source"

  msg "Building the project"
  make
}

#check() {
#  cd "${srcdir}/${pkgname}-${pkgver}-Source/build"
#  msg "Running unit tests"
#  make test
#}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source/build"

  msg "Installing files"
  make DESTDIR="${pkgdir}/" install
}
