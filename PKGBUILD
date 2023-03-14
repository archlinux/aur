# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=moveit_configs_utils
pkgname=ros2-humble-moveit-configs-utils
pkgver=2.5.4
pkgrel=1
pkgdesc="Python library for loading moveit config parameters in launch files"
url="https://index.ros.org/p/moveit_configs_utils/"
arch=('any')
depends=(
    'ros2-humble'
    'ros2-humble-launch-param-builder'
    'ros2-humble-srdfdom'
)
source=("https://github.com/ros-planning/moveit2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('42ac45e2631d59203edfdfc2f521312f7ddef04ff5baf1fec43c65f79495d7a6')

prepare() {
    source /opt/ros/humble/setup.bash
}

build() {
    cd moveit2-$pkgver/$_pkgname
    colcon build --merge-install
}

package() {
    # Copy build files
    mkdir -p $pkgdir/opt/ros/humble
    cp -r $srcdir/moveit2-$pkgver/$_pkgname/install/* $pkgdir/opt/ros/humble/
    # Exclude files that clash with base ros installation
    rm $pkgdir/opt/ros/humble/*setup.*
    rm $pkgdir/opt/ros/humble/_local_setup*
    rm $pkgdir/opt/ros/humble/COLCON_IGNORE
}
