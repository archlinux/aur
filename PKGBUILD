# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
pkgname=ignition-cmake
pkgver=0.4.1
pkgrel=1
pkgdesc="Provides modules that are used to find dependencies of ignition projects and generate cmake targets for consumers of ignition projects to link against."
arch=('any')
url="http://ignitionrobotics.org/libs/cmake"
license=('Apache')
groups=('development')
depends=('cmake')
optdepends=()
conflicts=()
source=("https://bitbucket.org/ignitionrobotics/ign-cmake/get/${pkgname}_${pkgver}.tar.bz2")
sha256sums=('c5f1c74714ed93ff0ba02c504c94055785aa877925fd003b8cdb433cf302a4ed')

_dir="ignitionrobotics-ign-cmake-1f49f8a81dd8"

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

check() {
  cd "$srcdir/$_dir/build"

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DENABLE_TESTS_COMPILATION:BOOL=True

  make
  make test
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
