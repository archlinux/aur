# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=gazebo_ros2_control
pkgname=ros2-humble-gazebo-ros2-control
pkgver=0.4.2
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
source=("https://github.com/ros-controls/gazebo_ros2_control/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fbe323cf876cac86d3c852cc9ccae63fdc36a760c73df6fa64f793fb0eb110e0')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S gazebo_ros2_control-$pkgver/$_pkgname -B build \
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
