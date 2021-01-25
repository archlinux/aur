#Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=sdformat
pkgver=10.1.0
pkgrel=2
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml2' 'ignition-math>=6' 'python-psutil' 'urdfdom')
makedepends=('cmake' 'doxygen' 'ignition-cmake' 'ignition-tools' 'ruby')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/osrf/${pkgname}/archive/${pkgname}10_${pkgver}.tar.gz")
sha256sums=('1fcb1df4c92cdf650b85015d41e31d4ae2da43c2c283685d6106f7cfd25ba8e0')

_dir="sdformat-${pkgname}10_${pkgver}"

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
