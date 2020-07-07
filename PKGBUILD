pkgname=ignition-transport-4
pkgver=4.0.0
pkgrel=4
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
source=("https://bitbucket.org/osrf-migrated/ign-transport/get/${_name}_${pkgver}.tar.bz2")
sha256sums=('6ddc5c279feecb9538e39730a231a3bad2971e3d0e5ad0b6575179f2dd337c30')

_dir="osrf-migrated-ign-transport-add6058e5b8c"

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
