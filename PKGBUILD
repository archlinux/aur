# Maintainer: Kino <cybao292261 at 163 dot com>

_pkgname=pcl_msgs
pkgname="ros2-humble-${_pkgname/_/-}"
pkgver=1.0.0
pkgrel=2
pkgdesc="Package containing PCL (Point Cloud Library)-related ROS messages."
url="https://index.ros.org/p/$_pkgname"
license=("BSD-3-Clause")
arch=('any')
makedepends=('cmake')
depends=('ros2-humble')
checkdepends=('cppcheck' 'flake8' 'gtest' 'python-pydocstyle')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ros-perception/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('9a3256d5bd44a2e99526c5cf4ed16198471d2b43c63be74a5fcf8d0dcbb29489')

build() {
  source /opt/ros/humble/setup.bash

  cmake -B build -S $_pkgname-$pkgver \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble \
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
