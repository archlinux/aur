# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=moveit2
_pkgname=moveit_core
pkgname=ros2-humble-moveit-core
pkgver=2.5.4
pkgrel=4
pkgdesc="Core libraries used by MoveIt"
url="https://index.ros.org/p/moveit_core/"
arch=('any')
makedepends=(
    'pkgconf'
    'orocos-kdl'
    'cmake'
)
depends=(
    'ros2-humble'
    'ros2-humble-moveit-common'
    'ros2-humble-angles'
    'assimp'
    'boost-libs'
    'eigen'
    'fcl'
    'urdfdom'
    'urdfdom-headers'
    'ros2-humble-moveit-msgs'
    'octomap'
    'ros2-humble-octomap-msgs'
    'pybind11'
    'ros2-humble-random-numbers'
    'ros2-humble-srdfdom'
    'ros2-humble-ruckig'
    'ros2-humble-eigen-stl-containers'
    'ros2-humble-geometric-shapes'
)
source=("https://github.com/ros-planning/moveit2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('42ac45e2631d59203edfdfc2f521312f7ddef04ff5baf1fec43c65f79495d7a6')


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
