# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=sdformat-6
pkgver=6.2.0
pkgrel=2
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml' 'ignition-math=4' 'python-psutil')
optdepends=('urdfdom')
makedepends=('cmake' 'doxygen' 'ignition-cmake=0' 'ignition-tools' 'ruby>=1.9.1')
provides=('sdformat=6')
_name="sdformat"
source=("http://bitbucket.org/osrf/${_name}/get/${_name}6_${pkgver}.tar.bz2")
sha256sums=('d607eeaff0cf91800a73d2cb79c462611b5afcd7745c60dbf6804210f807550b')

_dir="osrf-sdformat-d4d9796600b9"
prepare(){
  cd "${srcdir}/${_dir}"
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_INSTALL_LIBDIR=lib
}

build() {
  cd "${srcdir}/${_dir}/build"
  make
}

check() {
  cd "${srcdir}/${_dir}/build"
  make test
}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="$pkgdir/" install
}
