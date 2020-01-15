# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=sdformat-8
pkgver=8.7.1
pkgrel=1
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml' 'ignition-math>=6' 'python-psutil')
optdepends=('urdfdom')
makedepends=('cmake' 'doxygen' 'ignition-cmake>=2' 'ignition-tools' 'ruby')
provides=('sdformat=8')
_name="sdformat"
source=("http://bitbucket.org/osrf/${_name}/get/${_name}8_${pkgver}.tar.bz2")
sha256sums=('2db6cdf05d400b3eef97ee5fb350028a9b93c20fd0268f40ef7a597468141e4a')

_dir="osrf-sdformat-161f3cfce136"
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

#check() {
#  cd "${srcdir}/${_dir}/build"
#  make test
#}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="$pkgdir/" install
}
