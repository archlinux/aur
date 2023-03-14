# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=nav2_velocity_smoother
pkgname=ros2-humble-nav2-velocity-smoother
pkgver=1.1.6
pkgrel=1
pkgdesc="Nav2's Output velocity smoother"
url="https://index.ros.org/p/nav2_velocity_smoother/"
arch=('any')
makedepends=(
    'ros2-humble-nav2-common'
)
depends=(
    'ros2-humble' 
    'ros2-humble-nav2-util'
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
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
