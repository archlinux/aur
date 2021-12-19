#Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=sdformat
pkgver=12.3.0
pkgrel=1
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml2' 'ignition-math>=6' 'python-psutil' 'urdfdom')
makedepends=('cmake' 'doxygen' 'ignition-cmake' 'ignition-utils' 'ignition-tools' 'ruby')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/${pkgname}/archive/${pkgname}12_${pkgver}.tar.gz")
sha256sums=('3e0ec16fcc261e08ff6b9bb751bfab3da56636ae95135cd5b88efb59bf8042ab')

_dir="sdformat-${pkgname}12_${pkgver}"

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
