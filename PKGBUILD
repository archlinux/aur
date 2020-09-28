# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>
pkgname=sdformat-6
pkgver=6.2.0
pkgrel=5
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml' 'ignition-math=4' 'python-psutil')
optdepends=('urdfdom')
makedepends=('cmake' 'doxygen' 'ignition-cmake=0' 'ignition-tools' 'ruby>=1.9.1')
provides=('sdformat=6')
_name="sdformat"
source=("https://github.com/osrf/sdformat/archive/sdformat6_${pkgver}.tar.gz")
sha256sums=('88d0fe2fcf27842f33d60e087e9142312c0392d55dfb250f2a66e66d55eb40dd')

_dir="sdformat-sdformat6_${pkgver}"
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
