# Maintainer: Tim Rakowski <tim.rakowski@gmail.com>
# Contributor: Johannes Wienke <languitar@semipol.de>
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>
pkgname=ignition-transport
pkgver=4.0.0
pkgrel=1
pkgdesc="The transport library combines ZeroMQ with Protobufs to create a fast and efficient message passing system. Asynchronous message publication and subscription is provided along with service calls and discovery."
arch=('i686' 'x86_64')
url="http://ignitionrobotics.org/libs/transport"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'zeromq' 'ignition-msgs' 'ignition-tools' 'libutil-linux')
makedepends=('ignition-cmake' 'util-linux')
optdepends=()
conflicts=()
source=("https://bitbucket.org/ignitionrobotics/ign-transport/get/${pkgname}4_${pkgver}.tar.bz2")
md5sums=('998a3e080af324a5f789a8406ef390de')

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

check() {
  cd "${srcdir}/${_dir}/build"

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING=On
  make
  make test
}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="${pkgdir}/" install
}
