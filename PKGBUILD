# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=gazebo_ros_pkgs
_pkgname=gazebo_ros
pkgname=ros2-humble-gazebo-ros
pkgver=3.7.0
pkgrel=5
pkgdesc="Provides ROS plugins that offer message and service publishers for interfacing with"
url="https://index.ros.org/p/gazebo_ros/"
arch=('any')
depends=(
    'ros2-humble' 
    'ros2-humble-gazebo-dev'
    'ros2-humble-gazebo-msgs'
    'python-lxml'
    'libdart'
    'gdal'
)
makedepends=('cmake')
source=("https://github.com/ros-simulation/gazebo_ros_pkgs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('69093e3cc7c4194f958bff777e76ab7c9a8f5c880f764332eb961f791a5a73a4')


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
