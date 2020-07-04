# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>
pkgname=sdformat-6
pkgver=6.2.0
pkgrel=4
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="http://sdformat.org/"
license=('Apache')
depends=('boost' 'tinyxml' 'ignition-math=4' 'python-psutil')
optdepends=('urdfdom')
makedepends=('cmake' 'doxygen' 'ignition-cmake=0' 'ignition-tools' 'ruby>=1.9.1')
provides=('sdformat=6')
_name="sdformat"
source=("http://bitbucket.org/osrf-migrated/${_name}/get/${_name}6_${pkgver}.tar.bz2")
sha256sums=('43894eaa1d9cc4a486879e09870c4f3adec33a3fc87cc06d62fad74a0ae061dd')

_dir="osrf-migrated-sdformat-d4d9796600b9"
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
