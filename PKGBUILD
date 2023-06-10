# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=moveit2
_pkgname=moveit_ros/planning
pkgname=ros2-humble-moveit-ros-planning
pkgver=2.5.4
pkgrel=4
pkgdesc="Planning components of MoveIt that use ROS"
url="https://index.ros.org/p/moveit_ros_planning/"
arch=('any')
makedepends=('ros2-humble-moveit-common' 'cmake')
depends=(
    'ros2-humble'
    'ros2-humble-moveit-core'
    'ros2-humble-moveit-ros-occupancy-map-monitor'
    'ros2-humble-moveit-msgs'
    'ros2-humble-srdfdom'
    'urdfdom'
    'eigen'
)
source=("https://github.com/ros-planning/moveit2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('42ac45e2631d59203edfdfc2f521312f7ddef04ff5baf1fec43c65f79495d7a6')


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
