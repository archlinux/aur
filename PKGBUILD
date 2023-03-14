# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=controller_interface
pkgname=ros2-humble-controller-interface
pkgver=2.24.1
pkgrel=1
pkgdesc="Description of controller_interface"
url="https://index.ros.org/p/controller_interface/"
arch=('any')
depends=(
    'ros2-humble'
    'ros2-humble-hardware-interface'
)
source=("https://github.com/ros-controls/ros2_control/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ceaa6c11965e2136d1a511584bdaf5694f1e665429860ccac8b65f59230e14b2')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S ros2_control-$pkgver/$_pkgname -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
