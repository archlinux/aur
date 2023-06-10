# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=ros2_controllers
_pkgname=joint_state_broadcaster
pkgname=ros2-humble-joint-state-broadcaster
pkgver=2.21.0
pkgrel=2
pkgdesc="Broadcaster to publish joint state"
url="https://index.ros.org/p/joint_state_broadcaster/"
arch=('any')
makedepends=(
    'ros2-humble-controller-manager'
    'ros2-humble-ros2-control-test-assets'
    'cmake'
)
depends=(
    'ros2-humble' 
    'ros2-humble-backward-ros'
    'ros2-humble-control-msgs'
    'ros2-humble-generate-parameter-library'
    'ros2-humble-hardware-interface'
    'ros2-humble-realtime-tools'
)
source=("https://github.com/ros-controls/ros2_controllers/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d6761cdecb079122ce46b94b8dcae6f6580b9ef45ff8728447c0d7dd27b6b49c')


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
