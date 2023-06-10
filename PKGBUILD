# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=gazebo_ros_pkgs
_pkgname=gazebo_plugins
pkgname=ros2-humble-gazebo-plugins
pkgver=3.7.0
pkgrel=3
pkgdesc="Robot-independent Gazebo plugins for sensors, motors and dynamic reconfigurable components."
url="https://index.ros.org/p/gazebo_plugins/"
arch=('any')
depends=(
    'ros2-humble'
    'ros2-humble-cv-bridge'
    'ros2-humble-gazebo-dev'
    'ros2-humble-gazebo-msgs'
    'ros2-humble-gazebo-ros'
)
makedepends=('cmake')
source=("https://github.com/ros-simulation/gazebo_ros_pkgs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('69093e3cc7c4194f958bff777e76ab7c9a8f5c880f764332eb961f791a5a73a4')

prepare() {
    source /opt/ros/humble/setup.bash
}

build() {
    cmake -B build -S "$_pkgroot-$pkgver/$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
