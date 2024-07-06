# Maintainer: Kino <cybao292261 at 163 dot com>
# Contributor: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=xacro
pkgname=ros2-humble-xacro
pkgver=2.0.11
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
sha256sums=('0c9b1619f1cdcf863e5a29fe8c034ae5c310e39722ff089d5d1e440c4e41967f')

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
