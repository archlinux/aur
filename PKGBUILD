#Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=sdformat
pkgver=9.2.0
pkgrel=1
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml' 'ignition-math>=6' 'python-psutil')
optdepends=('urdfdom')
makedepends=('cmake' 'doxygen' 'ignition-cmake' 'ignition-tools' 'ruby>=1.9.1')
source=("https://github.com/osrf/${pkgname}/archive/${pkgname}9_${pkgver}.tar.gz")
sha256sums=('0e42001d92aa2c089c7d0c4ea6a30db2beeff0af3a9a357e7ccd0a4e1131cae7')

_dir="sdformat-${pkgname}9_${pkgver}"

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
