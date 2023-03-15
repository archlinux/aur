# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=launch_param_builder
pkgname=ros2-humble-launch-param-builder
pkgver=0.1.1
pkgrel=2
pkgdesc="Python library for loading parameters in launch files"
url="https://index.ros.org/p/launch_param_builder/"
arch=('any')
makedepends=(
    'python-pytest'
)
depends=(
    'ros2-humble'
    'python-yaml'
    'ros2-humble-xacro'
)
source=("https://github.com/PickNikRobotics/launch_param_builder/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2066c810d4ccc35577720f011e1a0daff5ed2b4bb9130d7fe64e48b3ed45cb07')

prepare() {
    source /opt/ros/humble/setup.bash   
}

build() {
source /opt/ros/humble/setup.bash
    colcon build --merge-install
}

package() {
    # Copy build files
    mkdir -p $pkgdir/opt/ros/humble
    cp -r $srcdir/install/* $pkgdir/opt/ros/humble/
    # Exclude files that clash with base ros installation
    rm $pkgdir/opt/ros/humble/*setup.*
    rm $pkgdir/opt/ros/humble/_local_setup*
    rm $pkgdir/opt/ros/humble/COLCON_IGNORE
}
