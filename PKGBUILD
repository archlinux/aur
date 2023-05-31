# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=RSL
pkgname=ros2-humble-rsl
pkgver=0.2.2
pkgrel=2
pkgdesc="ROS Support Library"
url="https://index.ros.org/p/rsl/"
arch=('any')
makedepends=(
    'clang'
    'range-v3'
)
depends=(
    'ros2-humble' 
    'fmt'
    'ros2-humble-tl-expected'
    'eigen'
    'ros2-humble-tcb-span'
)
source=("https://github.com/PickNikRobotics/RSL/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8c74f9e5a74d8ca46c952dcdc132bd8dceab9c104494cb03ade551ed49842d4b')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S RSL-$pkgver -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
source /opt/ros/humble/setup.bash
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
