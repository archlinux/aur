# Maintainer: Johannes Wienke <languitar@semipol.de>
# Original Maintainer: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>
pkgname=ignition-transport
pkgver=3.1.0
pkgrel=1
pkgdesc="The transport library combines ZeroMQ with Protobufs to create a fast and efficient message passing system"
arch=('i686' 'x86_64')
url="http://ignitionrobotics.org"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'zeromq' 'uuid' 'ignition-msgs')
makedepends=('cmake' 'ruby-ronn' 'pkg-config>=0.28' 'doxygen')
optdepends=()
conflicts=()
source=("https://bitbucket.org/ignitionrobotics/ign-transport/get/${pkgname}3_${pkgver}.tar.bz2")
md5sums=('fb511618941cf49f89e0f7ebe34901e7')

_dir="ignitionrobotics-ign-transport-242b31c2579b"

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
