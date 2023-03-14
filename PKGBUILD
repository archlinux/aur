# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=RSL
pkgname=ros2-humble-rsl
pkgver=0.2.1
pkgrel=1
pkgdesc="ROS Support Library"
url="https://index.ros.org/p/rsl/"
arch=('any')
makedepends=(
    'clang'
    'range-v3'
)
depends=(
    'ros2-humble' 
    'fmt'
    'ros2-humble-tl-expected'
    'eigen'
    'ros2-humble-tcb-span'
)
source=("https://github.com/PickNikRobotics/RSL/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('222fa948ca07940c91d980e6a4268adf0343257eab18136ae0519c37cac21eb6')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S RSL-$pkgver -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
