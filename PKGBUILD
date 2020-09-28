pkgname=ignition-transport-4
pkgver=4.0.0
pkgrel=5
pkgdesc="The transport library combines ZeroMQ with Protobufs to create a fast and efficient message passing system. Asynchronous message publication and subscription is provided along with service calls and discovery."
arch=('i686' 'x86_64')
url="https://ignitionrobotics.org/libs/transport"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'zeromq' 'ignition-msgs=1' 'ignition-tools' 'libutil-linux')
makedepends=('ignition-cmake=0' 'util-linux')
optdepends=()
provides=('ignition-transport=4')
_name="ignition-transport4"
source=("https://github.com/ignitionrobotics/ign-transport/archive/ignition-transport4_${pkgver}.tar.gz")
sha256sums=('69d8943df6947c9f09ce6176b62a03a721be9cfe75b5fada9a7b41d13281af52')

_dir="ign-transport-ignition-transport4_${pkgver}"

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
