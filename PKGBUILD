# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=moveit2
_pkgname=moveit_plugins/moveit_simple_controller_manager
pkgname=ros2-humble-moveit-simple-controller-manager
pkgver=2.5.4
pkgrel=3
pkgdesc="A generic, simple controller manager plugin for MoveIt"
url="https://index.ros.org/p/moveit_simple_controller_manager/"
arch=('any')
makedepends=(
    'ros2-humble-moveit-common'
    'cmake'
)
depends=(
    'ros2-humble'
    'ros2-humble-control-msgs'
)
source=("https://github.com/ros-planning/moveit2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('42ac45e2631d59203edfdfc2f521312f7ddef04ff5baf1fec43c65f79495d7a6')

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
