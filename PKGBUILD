# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=gazebo_ros2_control
_pkgname=gazebo_ros2_control
pkgname=ros2-humble-gazebo-ros2-control
pkgver=0.4.3
pkgrel=2
pkgdesc="gazebo_ros2_control"
url="https://index.ros.org/p/gazebo_ros2_control/"
arch=('any')
depends=(
    'ros2-humble'
    'ros2-humble-angles'
    'ros2-humble-gazebo-dev'
    'ros2-humble-gazebo-ros'
    'ros2-humble-controller-manager'
    'ros2-humble-hardware-interface'
)
makedepends=('cmake')
source=("https://github.com/ros-controls/gazebo_ros2_control/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('722098c4dc61da9f810da1aa959312ba85f679e85507a623846e911bedd7500c')


build() {
    source /opt/ros/humble/setup.bash

    cmake -B build -S "$_pkgroot-$pkgver/$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
