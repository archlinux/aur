# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=moveit_plugins/moveit_ros_control_interface
pkgname=ros2-humble-moveit-ros-control-interface
pkgver=2.5.4
pkgrel=2
pkgdesc="ros_control controller manager interface for MoveIt"
url="https://index.ros.org/p/moveit_ros_control_interface/"
arch=('any')
depends=(
    'ros2-humble'
    'ros2-humble-moveit-common'
    'ros2-humble-controller-manager-msgs'
    'ros2-humble-moveit-core'
    'ros2-humble-moveit-simple-controller-manager'
)
source=("https://github.com/ros-planning/moveit2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('42ac45e2631d59203edfdfc2f521312f7ddef04ff5baf1fec43c65f79495d7a6')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S moveit2-$pkgver/$_pkgname -B build \
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
