# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=ignition-cmake-0
pkgver=0.6.1
pkgrel=2
pkgdesc="Provides modules that are used to find dependencies of ignition projects and generate cmake targets for consumers of ignition projects to link against."
arch=('any')
url="http://ignitionrobotics.org/libs/cmake"
license=('Apache')
groups=('development')
depends=('cmake' 'pkg-config' 'ruby-ronn' 'doxygen')
optdepends=()
provides=('ignition-cmake=0')
_name="ignition-cmake"
source=("https://bitbucket.org/ignitionrobotics/ign-cmake/get/${_name}_${pkgver}.tar.bz2")
sha256sums=('ba786c3feaf5e916b9f04ad2b271ccf9c720397cbbad2e464fb4646854ce497e')

_dir="ignitionrobotics-ign-cmake-a93e1ac2472b"

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
