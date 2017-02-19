#Contributor: marauder <abhinav.kssk@gmail.com>
pkgname=ignition-msgs
pkgver=0.7.0
pkgrel=1
pkgdesc="Ignition Message protobuf messages and functions for robot applications"
arch=('i686' 'x86_64')
url="http://ignitionrobotics.org"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'ignition-math>=3')
makedepends=('cmake' 'ruby-ronn' 'pkg-config>=0.28' 'doxygen')
optdepends=()
conflicts=()
source=("https://bitbucket.org/ignitionrobotics/ign-msgs/get/${pkgname}_${pkgver}.tar.bz2")
sha256sums=('b62b1fc22592d45fd189c13ef6696c22a34c5755f3ff2fb1a62488adaf361a0d')

_dir="ignitionrobotics-ign-msgs-b5ed20ac644a"

prepare() {
  cd "${srcdir}/${_dir}"
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib"
}

build() {
  cd "${srcdir}/${_dir}/build"
  make
}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="${pkgdir}/" install
}
