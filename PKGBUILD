# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=joy_teleop
pkgname=ros2-humble-joy-teleop
pkgver=1.3.0
pkgrel=2
pkgdesc="A (to be) generic joystick interface to control a robot"
url="https://index.ros.org/p/joy_teleop/"
arch=('any')
depends=(
    'ros2-humble' 
    'ros2-humble-control-msgs'
    'ros2-humble-teleop-tools-msgs'
)
source=("https://github.com/ros-teleop/teleop_tools/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('902e5fbdec909ee66e1b428df5076f125c231361211a1bd2a10b933fbc4d1f85')

prepare() {
    source /opt/ros/humble/setup.bash
}

build() {
source /opt/ros/humble/setup.bash
    cd teleop_tools-$pkgver/$_pkgname
    colcon build --merge-install
}

package() {
    # Copy build files
    mkdir -p $pkgdir/opt/ros/humble
    cp -r $srcdir/teleop_tools-$pkgver/$_pkgname/install/* $pkgdir/opt/ros/humble/
    # Exclude files that clash with base ros installation
    rm $pkgdir/opt/ros/humble/*setup.*
    rm $pkgdir/opt/ros/humble/_local_setup*
    rm $pkgdir/opt/ros/humble/COLCON_IGNORE
}
