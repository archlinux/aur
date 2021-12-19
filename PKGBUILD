# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
# Contributor: Johannes Wienke <languitar@semipol.de>
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>
pkgname=ignition-transport
pkgver=11.0.0
pkgrel=1
pkgdesc="The transport library combines ZeroMQ with Protobufs to create a fast and efficient message passing system. Asynchronous message publication and subscription is provided along with service calls and discovery."
arch=('i686' 'x86_64')
url="https://ignitionrobotics.org/libs/transport"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'zeromq' 'ignition-msgs>=7' 'ignition-tools'
         'ignition-utils>=1' 'libutil-linux')
makedepends=('ignition-cmake>=2' 'util-linux')
optdepends=()
conflicts=()
source=("https://github.com/ignitionrobotics/ign-transport/archive/${pkgname}11_${pkgver}.tar.gz")
sha256sums=('b549f73751556ef30f38c35f8fd357da500313a41588c08efaca341cf8c0341f')

_dir="ign-transport-${pkgname}11_${pkgver}"

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
