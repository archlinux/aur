# Maintainer: Kino <cybao292261 at 163 dot com>

_pkgname=robot_localization
pkgname=ros2-humble-robot-localization
pkgver=3.5.3
pkgrel=1
pkgdesc="Provides nonlinear state estimation through sensor fusion of an abritrary number of sensors."
url="https://index.ros.org/p/robot_localization/"
license=('BSD-3-Clause')
arch=('x86_64')
makedepends=('cmake')
depends=(
    'boost'
    'eigen'
    'geographiclib'
    'ros2-humble'
    'ros2-humble-angles'
    'ros2-humble-geographic-msgs'
)
# checkdepends=('cppcheck' 'flake8' 'python-pydocstyle')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/cra-ros-pkg/robot_localization/archive/$pkgver.tar.gz")
sha256sums=('b965dd9d12490b4816d7d8cfaf4830a82849de89540edf5c9c6fdbef6bff762b')

build() {
  source /opt/ros/humble/setup.bash

  cmake -B build -S "$_pkgname-$pkgver" \
      -DCMAKE_BUILD_TYPE='Release' \
      -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
      -DBUILD_TESTING=OFF \
      -Wno-dev

  cmake --build build
}

# check() {
#   export LD_LIBRARY_PATH=$srcdir/build:$LD_LIBRARY_PATH
#   ctest --test-dir build --output-on-failure
# }

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $srcdir/$_pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
