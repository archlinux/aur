# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=ros2_controllers
_pkgname=forward_command_controller
pkgname=ros2-humble-forward-command-controller
pkgver=2.21.0
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
sha256sums=('d6761cdecb079122ce46b94b8dcae6f6580b9ef45ff8728447c0d7dd27b6b49c')

prepare() {
    source /opt/ros/humble/setup.bash
}

build() {
    cmake -B build -S "$_pkgroot-$pkgver/$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
