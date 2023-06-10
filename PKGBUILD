# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=navigation2
_pkgname=nav2_dwb_controller/nav2_dwb_controller
pkgname=ros2-humble-nav2-dwb-controller
pkgver=1.1.7
pkgrel=1
pkgdesc="ROS2 controller (DWB) metapackage"
url="https://index.ros.org/p/nav2_dwb_controller/"
arch=('any')
depends=(
    'ros2-humble'
    'ros2-humble-costmap-queue'
    'ros2-humble-dwb-core'
    'ros2-humble-dwb-critics'
    'ros2-humble-dwb-msgs'
    'ros2-humble-dwb-plugins'
    'ros2-humble-nav-2d-msgs'
    'ros2-humble-nav-2d-utils'
)
makedepends=('cmake')
source=("https://github.com/ros-planning/navigation2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1d89dc1ad7c75d4d1645c882a5aee037ca965908344a158bb9669ad80a85196b')

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
