# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=gazebo_dev
pkgname=ros2-humble-gazebo-dev
pkgver=3.7.0
pkgrel=2
pkgdesc="Provides a cmake config for the default version of Gazebo for the ROS distribution."
url="https://index.ros.org/p/gazebo_dev/"
arch=('any')
depends=(
    'ros2-humble' 
    'gazebo'
)
source=("https://github.com/ros-simulation/gazebo_ros_pkgs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('69093e3cc7c4194f958bff777e76ab7c9a8f5c880f764332eb961f791a5a73a4')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S gazebo_ros_pkgs-$pkgver/$_pkgname -B build \
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
