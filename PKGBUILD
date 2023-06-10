# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=ros2_controllers
_pkgname=joint_trajectory_controller
pkgname=ros2-humble-joint-trajectory-controller
pkgver=2.20.0
epoch=1
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
sha256sums=('1b05787726fe7b14d493dd612aa7eb4459da53ccaee261ae87b78bf73878a0e3')

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
