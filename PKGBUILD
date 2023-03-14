# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=parameter_traits
pkgname=ros2-humble-parameter-traits
pkgver=0.3.1
pkgrel=1
pkgdesc="Functions and types for rclcpp::Parameter"
url="https://index.ros.org/p/parameter_traits/"
arch=('any')
depends=(
    'ros2-humble' 
    'fmt'
    'ros2-humble-tl-expected'
    'ros2-humble-rsl'
    'ros2-humble-tcb-span'
)
source=("https://github.com/PickNikRobotics/generate_parameter_library/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1b0a4a2e30518ac3b416798cc593edfe1ec488d0c1ab05dbb31ae40c28f1edec')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S generate_parameter_library-$pkgver/$_pkgname -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
