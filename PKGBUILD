#Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=sdformat
pkgver=14.0.0
pkgrel=1
pkgdesc="Simulation Description Format (SDFormat) parser and description files."
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml2' 'ignition-math>6' 'python-psutil' 'urdfdom')
makedepends=('cmake' 'doxygen' 'ignition-cmake>2' 'ignition-utils>1'
             'ignition-tools>1' 'ruby')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/${pkgname}/archive/${pkgname}14_${pkgver}.tar.gz")
sha256sums=('a4f38865f7e8b79559c238a1aba7bab1a4ff46c22a67bb91325ad48ba7d25728')

_dir="sdformat-${pkgname}14_${pkgver}"

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
