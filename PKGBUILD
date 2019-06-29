# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=ignition-msgs-1
pkgver=1.0.0
pkgrel=1
pkgdesc="Standard set of message definitions, used by Ignition Transport, and other applications."
arch=('i686' 'x86_64')
url="http://ignitionrobotics.org"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'ignition-math=4' 'ignition-tools')
makedepends=('ignition-cmake=0' 'ruby-ronn' 'doxygen')
optdepends=()
provides=('ignition-msgs=1')
_name="ignition-msgs"
source=("https://bitbucket.org/ignitionrobotics/ign-msgs/get/${_name}_${pkgver}.tar.bz2")
sha256sums=('d5922f9f160aebc6fb1d6de32054e17c9493a6995ea0f1f3a56ba6448c3040ab')

_dir="ignitionrobotics-ign-msgs-9ba6a3e1c418"

build() {
  cd "${srcdir}/${_dir}"
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False
  make -j4
}

check() {
  cd "$srcdir/$_dir/build"

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=True

  make -j4
  make test
}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="${pkgdir}/" install
}
