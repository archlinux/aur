pkgname=ignition-cmake-0
pkgver=0.6.1
pkgrel=8
pkgdesc="Provides modules that are used to find dependencies of ignition projects and generate cmake targets for consumers of ignition projects to link against."
arch=('any')
url="https://ignitionrobotics.org/libs/cmake"
license=('Apache')
groups=('development')
depends=('cmake' 'pkg-config' 'ruby-ronn-ng' 'doxygen')
optdepends=()
provides=('ignition-cmake=0')
source=("https://github.com/ignitionrobotics/ign-cmake/archive/ignition-cmake_${pkgver}.tar.gz")
sha256sums=('149e359b23f843b764c7c1537820a12a76b555585cf4cb91ecfb3769a3d5da7a')

_dir="ign-cmake-ignition-cmake_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DENABLE_TESTS_COMPILATION:BOOL=False

  # Compile
  make
}

#check() {
#  cd "$srcdir/$_dir/build"
#
#  cmake .. -DCMAKE_BUILD_TYPE="Release" \
#           -DCMAKE_INSTALL_PREFIX="/usr" \
#           -DCMAKE_INSTALL_LIBDIR="lib" \
#           -DENABLE_TESTS_COMPILATION:BOOL=True
#
#  make
#  make test
#}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
