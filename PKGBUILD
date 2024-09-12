# Maintainer: Kino <cybao292261 at 163 dot com>

_pkgname=pcl_conversions
_metaname=perception_pcl
_distro=humble
pkgname="ros2-$_distro-${_pkgname/_/-}"
pkgver=2.4.5
pkgrel=1
pkgdesc="Provides conversions from PCL data types and ROS message types."
url="https://index.ros.org/p/$_pkgname/"
license=("BSD-3-Clause")
arch=('any')
makedepends=('cmake')
depends=(
  "eigen"
  "pcl"
  "ros2-$_distro"
  "ros2-$_distro-pcl-msgs"
)
checkdepends=('gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ros-perception/$_metaname/archive/$pkgver.tar.gz")
sha256sums=('018f1ceae604cae9e9beb1bbae31e79052f35c71bbbcedcf5adb44aaaf4aedab')

build() {
  source /opt/ros/$_distro/setup.bash

  cmake -B build -S $_metaname-$pkgver/$_pkgname \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/opt/ros/$_distro \
      -Wno-dev

  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
