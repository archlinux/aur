# Maintainer: Kino <cybao292261@163.com>

_pkgroot=geographic_info
_pkgname=geographic_msgs
pkgname=ros2-humble-geographic-msgs
pkgver=1.0.6
pkgrel=1
pkgdesc="ROS messages for Geographic Information Systems."
url="https://index.ros.org/p/geographic_info/"
license=('BSD-3-Clause')
arch=('x86_64')
makedepends=('cmake')
depends=('ros2-humble')
checkdepends=('cppcheck')
source=("$_pkgroot-$pkgver.tar.gz::https://github.com/ros-geographic-info/geographic_info/archive/$pkgver.tar.gz")
sha256sums=('7ae385951816abde470463b0b7ed24ad5e4dce2d8c6a2f120e42e337b013ae18')

build() {
  cmake -B build -S "$_pkgroot-$pkgver/$_pkgname" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
