# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=moveit_kinematics
pkgname=ros2-humble-moveit-kinematics
pkgver=2.5.4
pkgrel=2
pkgdesc="Package for all inverse kinematics solvers in MoveIt"
url="https://index.ros.org/p/moveit_kinematics/"
arch=('any')
makedepends=(
    'ros2-humble-moveit-common'
    'ros2-humble-moveit-ros-planning'
    'ros2-humble-moveit-resources-fanuc-description'
    'ros2-humble-moveit-resources-fanuc-moveit-config'
    'ros2-humble-moveit-resources-panda-description'
    'ros2-humble-moveit-resources-panda-moveit-config'
    'ros2-humble-moveit-configs-utils'
)
depends=(
    'ros2-humble'
    'ros2-humble-moveit-core'
    'eigen'
    'orocos-kdl'
    'ros2-humble-moveit-msgs'
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
