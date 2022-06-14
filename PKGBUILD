# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
# Contributor: Johannes Wienke <languitar@semipol.de>
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>
pkgname=ignition-transport
pkgver=11.1.0
pkgrel=1
pkgdesc="The transport library combines ZeroMQ with Protobufs to create a fast and efficient message passing system. Asynchronous message publication and subscription is provided along with service calls and discovery."
arch=('i686' 'x86_64')
url="https://gazebosim.org/libs/transport"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'zeromq' 'ignition-msgs>=7' 'ignition-tools'
         'ignition-utils>=1' 'libutil-linux' 'tinyxml2')
makedepends=('ignition-cmake>=2' 'util-linux')
optdepends=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/gazebosim/gz-transport/archive/${pkgname}11_${pkgver}.tar.gz")
sha256sums=('7fe0398e49aa984501be15cb5b2853b9a4c3627f24ae079e049c93cc9cb609d9')

_dir="gz-transport-${pkgname}11_${pkgver}"

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
