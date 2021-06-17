#Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=sdformat
pkgver=11.1.0
pkgrel=1
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml2' 'ignition-math>=6' 'python-psutil' 'urdfdom')
makedepends=('cmake' 'doxygen' 'ignition-cmake' 'ignition-utils' 'ignition-tools' 'ruby')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/osrf/${pkgname}/archive/${pkgname}11_${pkgver}.tar.gz")
sha256sums=('a0798154e4e5874037a81c9dfbb7642c9a6e199ad3c7c5dbbd20bf0d50e4f2a9')

_dir="sdformat-${pkgname}11_${pkgver}"

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
