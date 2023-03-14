# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=play_motion2
pkgname=ros2-humble-play-motion2
pkgver=0.0.5
pkgrel=1
pkgdesc="A tool to play and handle pre-recorded motions in ROS2"
url="https://github.com/pal-robotics/play_motion2/"
arch=('any')
makedepends=(
    'ros2-humble-controller-manager'
    'ros2-humble-hardware-interface'
    'ros2-humble-joint-state-broadcaster'
    'ros2-humble-joint-trajectory-controller'
    'ros2-humble-xacro'
)
depends=(
    'ros2-humble'
    'ros2-humble-control-msgs'
    'ros2-humble-play-motion2-msgs'
)
source=("https://github.com/pal-robotics/play_motion2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('49195d29e6d05b4c8a3404369f40de14c2644e14ce3982e9c568bd841931260f')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S play_motion2-$pkgver/$_pkgname -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
