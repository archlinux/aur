# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

pkgname=ros2-humble-slam-toolbox
pkgver=2.6.4
pkgrel=2
pkgdesc="This package provides a sped up improved slam karto with updated SDK and visualization and modification toolsets"
url="https://index.ros.org/p/slam_toolbox/"
arch=('any')
depends=(
    'ros2-humble' 
    'eigen'
    'boost-libs'
    'suitesparse'
    'ceres-solver'
    'lapack'
    'tbb'
    'qt5-base'
    'ros2-humble-nav2-map-server'
)
source=("https://github.com/SteveMacenski/slam_toolbox/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('27242664b7964180f48f53f7594a1e6a06a2f96e9d54285eb159be9fd7eedb08')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S slam_toolbox-$pkgver -B build \
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
