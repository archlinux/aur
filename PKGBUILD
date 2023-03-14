# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=nav2_core
pkgname=ros2-humble-nav2-core
pkgver=1.1.6
pkgrel=1
pkgdesc="A set of headers for plugins core to the Nav2 stack"
url="https://index.ros.org/p/nav2_core/"
arch=('any')
makedepends=(
    'ros2-humble-nav2-common'
)
depends=(
    'ros2-humble' 
    'ros2-humble-nav2-util'
    'ros2-humble-nav2-costmap-2d'
)
source=("https://github.com/ros-planning/navigation2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('43abfa0eba8e3862e9f69e39399b0b6b627d2fa44faede494b09b7ee8c2626c1')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S navigation2-$pkgver/$_pkgname -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
