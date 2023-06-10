# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=generate_parameter_library
_pkgname=parameter_traits
pkgname=ros2-humble-parameter-traits
pkgver=0.3.3
pkgrel=2
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
makedepends=('cmake')
source=("https://github.com/PickNikRobotics/generate_parameter_library/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f1fd0bd411191a68ce70833c97aa0925525951127709819eb00e7a4007f5447e')


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
