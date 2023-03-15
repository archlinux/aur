# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=nav2_costmap_2d
pkgname=ros2-humble-nav2-costmap-2d
pkgver=1.1.6
pkgrel=2
pkgdesc="This package provides an implementation of a 2D costmap that takes in sensor data from the world, builds a 2D or 3D occupancy grid of the data"
url="https://index.ros.org/p/nav2_costmap_2d/"
arch=('any')
makedepends=(
    'ros2-humble-nav2-common'
    'ros2-humble-nav2-map-server'
    'ros2-humble-nav2-lifecycle-manager'
)
depends=(
    'ros2-humble' 
    'ros2-humble-nav2-msgs'
    'ros2-humble-nav2-util'
    'ros2-humble-nav2-voxel-grid'
    'ros2-humble-angles'
)
source=("https://github.com/ros-planning/navigation2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('43abfa0eba8e3862e9f69e39399b0b6b627d2fa44faede494b09b7ee8c2626c1')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S navigation2-$pkgver/$_pkgname -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble \
        -DCMAKE_CXX_FLAGS="-Wno-error=maybe-uninitialized"
}

build() {
source /opt/ros/humble/setup.bash
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
