# Maintainer: Nxxx <nx dot tardis at gmail dot com>

pkgname=ignition-transport-8
pkgver=8.2.0
pkgrel=1
pkgdesc="The transport library combines ZeroMQ with Protobufs to create a fast and efficient message passing system. Asynchronous message publication and subscription is provided along with service calls and discovery."
arch=('i686' 'x86_64')
url="https://ignitionrobotics.org/libs/transport"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'zeromq' 'ignition-msgs-5' 'ignition-tools'
         'libutil-linux')
makedepends=('ignition-cmake>=2' 'util-linux')
optdepends=()
conflicts=()
source=("https://github.com/ignitionrobotics/ign-transport/archive/ignition-transport8_${pkgver}.tar.gz")
sha256sums=('5b1fe23f7704c7bb17884ab8151ef5462b52059575d11a85a13e72395f1967e7')

_dir="ign-transport-ignition-transport8_${pkgver}"

build() {
  cd "${srcdir}/${_dir}"
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING=Off
  make
}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="${pkgdir}/" install
}
