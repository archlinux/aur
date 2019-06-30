# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=ignition-transport-4
pkgver=4.0.0
pkgrel=2
pkgdesc="The transport library combines ZeroMQ with Protobufs to create a fast and efficient message passing system. Asynchronous message publication and subscription is provided along with service calls and discovery."
arch=('i686' 'x86_64')
url="http://ignitionrobotics.org/libs/transport"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'zeromq' 'ignition-msgs=1' 'ignition-tools' 'libutil-linux')
makedepends=('ignition-cmake=0' 'util-linux')
optdepends=()
provides=('ignition-transport=4')
_name="ignition-transport4"
source=("https://bitbucket.org/ignitionrobotics/ign-transport/get/${_name}_${pkgver}.tar.bz2")
sha256sums=('72d1e603b9c0ffb54b088f9e42fc27f9e5971a4dac076351b592cb3938ce96d1')

_dir="ignitionrobotics-ign-transport-add6058e5b8c"

build() {
  cd "${srcdir}/${_dir}"
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING=Off
  make
}

#check() {
#  cd "${srcdir}/${_dir}/build"
#
#  cmake .. -DCMAKE_BUILD_TYPE="Release" \
#           -DCMAKE_INSTALL_PREFIX="/usr" \
#           -DCMAKE_INSTALL_LIBDIR="lib" \
#           -DBUILD_TESTING=On
#  make
#  make test
#}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="${pkgdir}/" install
}
