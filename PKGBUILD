# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=moveit2
_pkgname=moveit_planners/ompl
pkgname=ros2-humble-moveit-planners-ompl
pkgver=2.5.4
pkgrel=4
pkgdesc="MoveIt interface to OMPL"
url="https://index.ros.org/p/moveit_planners_ompl/"
arch=('any')
makedepends=(
    'ros2-humble-moveit-common'
    'ros2-humble-moveit-resources-pr2-description'
    'ros2-humble-moveit-resources-fanuc-moveit-config'
    'ros2-humble-moveit-resources-panda-moveit-config'
    'eigen'
    'cmake'
)
depends=(
    'ros2-humble'
    'ros2-humble-moveit-core'
    'ros2-humble-moveit-msgs'
    'ros2-humble-moveit-ros-planning'
    'ompl'
    'openmp'
    'python'
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
