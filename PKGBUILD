# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=moveit_ros/planning_interface
pkgname=ros2-humble-moveit-ros-planning-interface
pkgver=2.5.4
pkgrel=1
pkgdesc="Components of MoveIt that offer simpler interfaces to planning and execution"
url="https://index.ros.org/p/moveit_ros_planning_interface/"
arch=('any')
makedepends=(
    'ros2-humble-moveit-common'
    'ros2-humble-moveit-resources-fanuc-moveit-config'
    'ros2-humble-moveit-resources-panda-moveit-config'
    'ros2-humble-moveit-simple-controller-manager'
    'ros2-humble-moveit-planners-ompl'
    'ros2-humble-moveit-configs-utils'
)
depends=(
    'ros2-humble'
    'ros2-humble-moveit-core'
    'ros2-humble-moveit-ros-planning'
    'ros2-humble-moveit-ros-warehouse'
    'ros2-humble-moveit-ros-move-group'
    'ros2-humble-moveit-msgs'
    'python'
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
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
