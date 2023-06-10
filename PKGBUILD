# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=ros2_controllers
_pkgname=forward_command_controller
pkgname=ros2-humble-forward-command-controller
pkgver=2.17.3
epoch=2
pkgrel=1
pkgdesc="Generic controller for forwarding commands"
url="https://index.ros.org/p/forward_command_controller/"
arch=('any')
makedepends=(
    'ros2-humble-controller-manager'
    'ros2-humble-ros2-control-test-assets'
    'cmake'
)
depends=(
    'ros2-humble' 
    'ros2-humble-backward-ros'
    'ros2-humble-controller-interface'
    'ros2-humble-generate-parameter-library'
    'ros2-humble-hardware-interface'
    'ros2-humble-realtime-tools'
)
source=("https://github.com/ros-controls/ros2_controllers/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e42b1e8b59c44c0ac8d272255a5b8e9922d489ce5d05e7da796dcb92e24a6b58')


build() {
    source /opt/ros/humble/setup.bash

    cmake -B build -S "$_pkgroot-$pkgver/$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
