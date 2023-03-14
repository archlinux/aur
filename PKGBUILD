#Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=sdformat
pkgver=13.3.0
pkgrel=2
pkgdesc="Simulation Description Format (SDFormat) parser and description files."
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml2' 'ignition-math>6' 'python-psutil' 'urdfdom')
makedepends=('cmake' 'doxygen' 'ignition-cmake>2' 'ignition-utils>1'
             'ignition-tools>1' 'ruby')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/${pkgname}/archive/${pkgname}13_${pkgver}.tar.gz")
sha256sums=('c21c70eb9a7d436d1cd083d9d5c4fce2ff645bdb27fc86332eab87d0ef081e6b')

_dir="sdformat-${pkgname}13_${pkgver}"

build() {
  cd "${srcdir}/${_dir}"
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_INSTALL_LIBDIR=lib

  make
}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="$pkgdir/" install
}
