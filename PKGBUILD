# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=realtime_tools
pkgname=ros2-humble-realtime-tools
pkgver=2.5.0
pkgrel=1
pkgdesc="Contains a set of tools that can be used from a hard realtime thread, without breaking the realtime behavior"
url="https://index.ros.org/p/realtime_tools/"
arch=('any')
depends=(
    'ros2-humble'
)
source=("https://github.com/ros-controls/realtime_tools/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ca6f1514042168b39948ceb0290d13cfba0416487b9d3fcf470e2a06bab032b7')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S realtime_tools-$pkgver -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
