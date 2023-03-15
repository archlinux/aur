# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=backward_ros
pkgname=ros2-humble-backward-ros
pkgver=1.0.2
pkgrel=2
pkgdesc="The backward_ros package is a ros wrapper of backward-cpp"
url="https://index.ros.org/p/backward_ros/"
arch=('any')
depends=(
    'ros2-humble' 
    'pahole'
)
source=("https://github.com/pal-robotics/backward_ros/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4f5e81e20584493e4a9dd36a348e809058e38648f71fbf5fc529e8d880357251')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S backward_ros-$pkgver -B build \
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
