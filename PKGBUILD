# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=RSL
pkgname=ros2-humble-rsl
pkgver=0.2.2
pkgrel=5
pkgdesc="ROS Support Library"
url="https://index.ros.org/p/rsl/"
arch=('any')
makedepends=(
    'range-v3'
    'cmake'
    'doxygen'
)
depends=(
    'ros2-humble' 
    'fmt'
    'ros2-humble-tl-expected'
    'eigen'
    'ros2-humble-tcb-span'
)
source=("https://github.com/PickNikRobotics/RSL/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8c74f9e5a74d8ca46c952dcdc132bd8dceab9c104494cb03ade551ed49842d4b')


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
