pkgname=ignition-msgs-1
pkgver=1.0.0
pkgrel=6
pkgdesc="Standard set of message definitions, used by Ignition Transport, and other applications."
arch=('i686' 'x86_64')
url="https://ignitionrobotics.org/libs/msgs"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'ignition-math=4' 'ignition-tools')
makedepends=('ignition-cmake=0' 'ruby-ronn-ng' 'doxygen')
optdepends=()
provides=('ignition-msgs=1')
_name="ignition-msgs"
source=("https://github.com/ignitionrobotics/ign-msgs/archive/ignition-msgs_${pkgver}.tar.gz")
sha256sums=('4327e47c1ed01fc635b1a1bad0e86b78cdfd401540eb3d0f94e98be161a753ee')

_dir="ign-msgs-ignition-msgs_${pkgver}"

build() {
  cd "${srcdir}/${_dir}"
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False
  make
}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="${pkgdir}/" install
}
