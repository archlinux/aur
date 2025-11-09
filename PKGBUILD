# Maintainer: Kino <cybao292261 at 163 dot com>
# Contributor: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=xacro
pkgname=ros2-humble-xacro
pkgver=2.1.1
pkgrel=2
pkgdesc="A tool to construct shorter and more readable XML files by using macros that expand to larger XML expressions"
url="https://index.ros.org/p/xacro/"
license=('BSD-3-Clause')
arch=('any')
makedepends=('cmake')
depends=(
    'ros2-humble'
    'python-yaml'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ros/xacro/archive/${pkgver}.tar.gz")
sha256sums=('f9d94956574015427e59011d4ee113b206e9c10a27a0c01d4b08ee4268d76741')

build() {
  source /opt/ros/humble/setup.bash

  cmake -B build -S "$_pkgname-$pkgver" \
      -DCMAKE_BUILD_TYPE='None' \
      -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
      -Wno-dev

  cmake --build build
}

check() {
  export PYTHONPATH=$PWD/ament_cmake_python/xacro:$PYTHONPATH
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $srcdir/xacro-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
