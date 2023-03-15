# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=bondcpp
pkgname=ros2-humble-bondcpp
pkgver=3.0.2
pkgrel=2
pkgdesc="C++ implementation of bond, a mechanism for checking when another process has terminated."
url="https://index.ros.org/p/bondcpp/"
arch=('any')
makedepends=(
    'pkgconf'
)
depends=(
    'ros2-humble' 
    'ros2-humble-bond'
    'ros2-humble-smclib'
)
source=("https://github.com/ros/bond_core/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('16f0a741c238057146c50f4537d0e41c6c1842f7890a9fea1e782743ec9909f3')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S bond_core-$pkgver/$_pkgname -B build \
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
