# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=warehouse_ros
pkgname=ros2-humble-warehouse-ros
pkgver=2.0.4
pkgrel=4
pkgdesc="Persistent storage of ROS messages"
url="https://index.ros.org/p/warehouse_ros/"
arch=('any')
depends=(
    'ros2-humble'
    'boost-libs'
    'openssl'
)
makedepends=(
    'boost'
    'cmake'
)
source=("https://github.com/ros-planning/warehouse_ros/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('84edb26f4e959ef193a02248bd1d8420b2e144520719189844bace97ee440ddc')


build() {
    source /opt/ros/humble/setup.bash

    cmake -B build -S "$_pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
