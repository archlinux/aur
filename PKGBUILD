# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=warehouse_ros
pkgname=ros2-humble-warehouse-ros
pkgver=2.0.4
pkgrel=2
pkgdesc="Persistent storage of ROS messages"
url="https://index.ros.org/p/warehouse_ros/"
arch=('any')
depends=(
    'ros2-humble'
    'boost-libs'
    'openssl'
)
source=("https://github.com/ros-planning/warehouse_ros/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('84edb26f4e959ef193a02248bd1d8420b2e144520719189844bace97ee440ddc')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S warehouse_ros-$pkgver -B build \
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
