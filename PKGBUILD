# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=navigation2
_pkgname=nav2_simple_commander
pkgname=ros2-humble-nav2-simple-commander
pkgver=1.1.7
pkgrel=1
pkgdesc="An importable library for writing mobile robot applications in python3"
url="https://index.ros.org/p/nav2_simple_commander/"
arch=('any')
makedepends=('python-pytest' 'cmake')
depends=(
    'ros2-humble' 
    'ros2-humble-nav2-msgs'
)
source=("https://github.com/ros-planning/navigation2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1d89dc1ad7c75d4d1645c882a5aee037ca965908344a158bb9669ad80a85196b')

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
