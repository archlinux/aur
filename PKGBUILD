# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
# Contributor: marauder <abhinav.kssk@gmail.com>
pkgname=ignition-msgs
pkgver=5.1.0
pkgrel=1
pkgdesc="Standard set of message definitions, used by Ignition Transport, and other applications."
arch=('i686' 'x86_64')
url="http://ignitionrobotics.org"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'ignition-math>=6' 'ignition-tools')
makedepends=('ignition-cmake>=2' 'ruby-ronn' 'doxygen')
optdepends=()
conflicts=()
source=("https://bitbucket.org/ignitionrobotics/ign-msgs/get/${pkgname}5_${pkgver}.tar.bz2")
sha256sums=('b4ddbcfc797ad64e8ac1f64d5fb456059d3d78ff56adcd858e149c6ee8d0350a')

_dir="ignitionrobotics-ign-msgs-bedb5065b7f4"

build() {
  cd "${srcdir}/${_dir}"
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False
  make
}

#check() {
#  cd "$srcdir/$_dir/build"
#
#  cmake .. -DCMAKE_BUILD_TYPE="Release" \
#           -DCMAKE_INSTALL_PREFIX="/usr" \
#           -DCMAKE_INSTALL_LIBDIR="lib" \
#           -DBUILD_TESTING:BOOL=True
#
#  make
#  make test
#}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="${pkgdir}/" install
}
