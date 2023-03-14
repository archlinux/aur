
# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=joint_state_publisher_gui
pkgname=ros2-humble-joint-state-publisher-gui
pkgver=2.3.0
pkgrel=1
pkgdesc="This package contains a GUI tool for setting and publishing joint state values for a given URDF"
url="https://index.ros.org/p/joint_state_publisher_gui/"
arch=('any')
depends=(
    'ros2-humble'
    'ros2-humble-joint-state-publisher'
)
source=("https://github.com/ros/joint_state_publisher/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('648d177b988b1da6316cea552cd999c37dd35ec514f7d1d9edd4a823ab2656d3')

prepare() {
    source /opt/ros/humble/setup.bash
}

build() {
    cd joint_state_publisher-$pkgver/$_pkgname
    colcon build --merge-install
}

package() {
    # Copy build files
    mkdir -p $pkgdir/opt/ros/humble
    cp -r $srcdir/joint_state_publisher-$pkgver/$_pkgname/install/* $pkgdir/opt/ros/humble/
    # Exclude files that clash with base ros installation
    rm $pkgdir/opt/ros/humble/*setup.*
    rm $pkgdir/opt/ros/humble/_local_setup*
    rm $pkgdir/opt/ros/humble/COLCON_IGNORE
}
