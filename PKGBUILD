# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
# Contributor: marauder <abhinav.kssk@gmail.com>
pkgname=ignition-msgs
pkgver=8.6.0
pkgrel=1
pkgdesc="Standard set of message definitions, used by Ignition Transport, and other applications."
arch=('i686' 'x86_64')
url="https://gazebosim.org/libs/msgs"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'ignition-math>=6' 'ignition-tools')
makedepends=('ignition-cmake>=2' 'ruby-ronn' 'doxygen' 'tinyxml2')
optdepends=()
conflicts=()
source=("${pkgname}-${pkgver}::https://github.com/gazebosim/gz-msgs/archive/${pkgname}8_${pkgver}.tar.gz")
sha256sums=('c850fc9d39bd3b60430fa8f8e6f933ffd191714136be3505a506b0bb297eebaa')

_dir="gz-msgs-${pkgname}8_${pkgver}"

build() {
  cd "${srcdir}/${_dir}"
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False
  make
}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="${pkgdir}/" install
}
