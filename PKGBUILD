# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=joint_state_broadcaster
pkgname=ros2-humble-joint-state-broadcaster
pkgver=2.17.2
pkgrel=1
pkgdesc="Broadcaster to publish joint state"
url="https://index.ros.org/p/joint_state_broadcaster/"
arch=('any')
makedepends=(
    'ros2-humble-controller-manager'
    'ros2-humble-ros2-control-test-assets'
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
sha256sums=('87f488479f0d4cdbdcdef5ec5a6238c8fd4a84fda9f365d90feafb1f3903c245')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S ros2_controllers-$pkgver/$_pkgname -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
