# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
# Contributor: marauder <abhinav.kssk@gmail.com>
pkgname=ignition-msgs
pkgver=10.0.0
pkgrel=1
pkgdesc="Messages for Gazebo robot simulation."
arch=('i686' 'x86_64')
url="https://gazebosim.org/libs/msgs"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'ignition-math>6' 'ignition-utils>1'
         'ignition-tools>1' 'python')
makedepends=('ignition-cmake>2' 'ruby-ronn' 'doxygen' 'tinyxml2')
source=("${pkgname}-${pkgver}::https://github.com/gazebosim/gz-msgs/archive/gz-msgs10_${pkgver}.tar.gz")
sha256sums=('81afeb973252ffabcbab1372271efac2d3dbd52679916b495000215f43d54997')

_dir="gz-msgs-gz-msgs10_${pkgver}"

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
