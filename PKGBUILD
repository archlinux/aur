# Maintainer: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>
pkgname=ignition-transport
pkgver=0.9.0
pkgrel=2
pkgdesc="The transport library combines ZeroMQ with Protobufs to create a fast and efficient message passing system"
arch=('i686' 'x86_64')
url="http://ignitionrobotics.org"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'zeromq' 'uuid')
makedepends=('cmake' 'ruby-ronn' 'pkg-config>=0.28' 'doxygen')
optdepends=()
conflicts=()
source=("https://bitbucket.org/ignitionrobotics/ign-transport/get/${pkgname}_${pkgver}.tar.bz2")
sha256sums=('6e8849f87c92965365a912a14fab500ce6ca4b773b0d75b68afb3a7bec69871b')

_dir="ignitionrobotics-ign-transport-226626546cde"

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
