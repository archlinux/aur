# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=backward_ros
pkgname=ros2-humble-backward-ros
pkgver=1.0.2
pkgrel=5
pkgdesc="The backward_ros package is a ros wrapper of backward-cpp"
url="https://index.ros.org/p/backward_ros/"
arch=('any')
depends=(
    'ros2-humble' 
    'pahole'
)
makedepends=('cmake')
source=("https://github.com/pal-robotics/backward_ros/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4f5e81e20584493e4a9dd36a348e809058e38648f71fbf5fc529e8d880357251')

build() {
    source /opt/ros/humble/setup.bash

    cmake -B build -S "$_pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
