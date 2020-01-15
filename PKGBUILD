# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
# Contributor: Johannes Wienke <languitar@semipol.de>
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>
pkgname=ignition-transport
pkgver=8.0.0
pkgrel=1
pkgdesc="The transport library combines ZeroMQ with Protobufs to create a fast and efficient message passing system. Asynchronous message publication and subscription is provided along with service calls and discovery."
arch=('i686' 'x86_64')
url="http://ignitionrobotics.org/libs/transport"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'zeromq' 'ignition-msgs>=5' 'ignition-tools'
         'libutil-linux')
makedepends=('ignition-cmake>=2' 'util-linux')
optdepends=()
conflicts=()
source=("https://bitbucket.org/ignitionrobotics/ign-transport/get/${pkgname}8_${pkgver}.tar.bz2")
sha256sums=('b12009472e301f395a6331565c790e63559da7a946560629cef09734cc1a19ad')

_dir="ignitionrobotics-ign-transport-6ab0cd7f1306"

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
