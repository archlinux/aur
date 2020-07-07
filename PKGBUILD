pkgname=ignition-msgs-1
pkgver=1.0.0
pkgrel=4
pkgdesc="Standard set of message definitions, used by Ignition Transport, and other applications."
arch=('i686' 'x86_64')
url="https://ignitionrobotics.org/libs/msgs"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'ignition-math=4' 'ignition-tools')
makedepends=('ignition-cmake=0' 'ruby-ronn' 'doxygen')
optdepends=()
provides=('ignition-msgs=1')
_name="ignition-msgs"
source=("https://bitbucket.org/osrf-migrated/ign-msgs/get/${_name}_${pkgver}.tar.bz2")
sha256sums=('3f20453cc3fedeb414684bd0ed5ee042c30d19aa01cc9a4aad5685a1c6ded35d')

_dir="osrf-migrated-ign-msgs-9ba6a3e1c418"

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
