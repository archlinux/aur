# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=control_toolbox
_pkgname=control_toolbox
pkgname=ros2-humble-control-toolbox
pkgver=2.2.0
pkgrel=4
pkgdesc="The control toolbox contains modules that are useful across all controllers."
url="https://index.ros.org/p/control_toolbox/"
arch=('any')
depends=(
    'ros2-humble'
    'ros2-humble-control-msgs'
    'ros2-humble-realtime-tools'
)
makedepends=('cmake')
source=("https://github.com/ros-controls/control_toolbox/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0f9b4ae39b6a0033cb7bd77de835d49acf8cb72bc0e71c143e0a1d1449df23a0')


build() {
    source /opt/ros/humble/setup.bash

    cmake -B build -S "$_pkgroot-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
