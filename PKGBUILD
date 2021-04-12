# Maintainer: Nxxx <nx dot tardis at gmail dot com>

pkgname=ignition-msgs-5
pkgver=5.7.0
pkgrel=1
pkgdesc="Standard set of message definitions, used by Ignition Transport, and other applications."
arch=('i686' 'x86_64')
url="https://ignitionrobotics.org/libs/msgs"
license=('Apache')
groups=('development')
depends=('protobuf' 'protobuf-c' 'ignition-math>=6' 'ignition-tools')
makedepends=('ignition-cmake>=2' 'ruby-ronn' 'doxygen' 'tinyxml2')
optdepends=()
conflicts=()
source=("${pkgname}-${pkgver}::https://github.com/ignitionrobotics/ign-msgs/archive/ignition-msgs5_${pkgver}.tar.gz")
sha256sums=('1aafdf96e6eda9dd14ed302029aa1954f2e02356b00b0e9aef8831692ff62bef')

_dir="ign-msgs-ignition-msgs5_${pkgver}"

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
