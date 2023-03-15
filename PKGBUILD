# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=nav2_smoother
pkgname=ros2-humble-nav2-smoother
pkgver=1.1.6
pkgrel=2
pkgdesc="Smoother action interface"
url="https://index.ros.org/p/nav2_smoother/"
arch=('any')
makedepends=(
    'ros2-humble-nav2-common'
)
depends=(
    'ros2-humble' 
    'ros2-humble-angles'
    'ros2-humble-nav2-util'
    'ros2-humble-nav2-msgs'
    'ros2-humble-nav-2d-utils'
    'ros2-humble-nav-2d-msgs'
    'ros2-humble-nav2-core'
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
