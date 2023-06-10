# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=ros2_controllers
_pkgname=joint_trajectory_controller
pkgname=ros2-humble-joint-trajectory-controller
pkgver=2.21.0
pkgrel=1
pkgdesc="Controller for executing joint-space trajectories on a group of joints"
url="https://index.ros.org/p/joint_trajectory_controller/"
arch=('any')
makedepends=(
    'ros2-humble-controller-manager'
    'ros2-humble-ros2-control-test-assets'
)
depends=(
    'ros2-humble' 
    'ros2-humble-angles'
    'ros2-humble-realtime-tools'
    'ros2-humble-backward-ros'
    'ros2-humble-controller-interface'
    'ros2-humble-control-msgs'
    'ros2-humble-control-toolbox'
    'ros2-humble-hardware-interface'
    'ros2-humble-generate-parameter-library'
)
source=("https://github.com/ros-controls/ros2_controllers/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d6761cdecb079122ce46b94b8dcae6f6580b9ef45ff8728447c0d7dd27b6b49c')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S ros2_controllers-$pkgver/$_pkgname -B build \
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
