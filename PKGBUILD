# Maintainer: Johannes Wienke <languitar@semipol.de>
# Original Maintainer: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>
pkgname=ignition-transport
pkgver=3.0.1
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
md5sums=('faf7298ec251e939b1bf446a3922b29c')

_dir="ignitionrobotics-ign-transport-43199f9158dc"

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
