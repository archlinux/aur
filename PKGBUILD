#Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=sdformat
pkgver=9.1.0
pkgrel=1
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml' 'ignition-math>=6' 'python-psutil')
optdepends=('urdfdom')
makedepends=('cmake' 'doxygen' 'ignition-cmake' 'ignition-tools' 'ruby>=1.9.1')

source=("https://bitbucket.org/osrf/${pkgname}/get/${pkgname}9_${pkgver}.tar.bz2")
sha256sums=('d3981edbfd92f0ad3193cfc08d667af6a425fbb607a186befa68a132a32a7795')

_dir="osrf-sdformat-632993e4b142"
prepare(){
  cd "${srcdir}/${_dir}"
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_INSTALL_LIBDIR=lib
}

build() {
  cd "${srcdir}/${_dir}/build"
  make
}

# check() {
#   cd "${srcdir}/${pkgname}-${pkgver}/build"
#   make test
# }

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="$pkgdir/" install
}
