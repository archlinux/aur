# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=nav2_simple_commander
pkgname=ros2-humble-nav2-simple-commander
pkgver=1.1.6
pkgrel=2
pkgdesc="An importable library for writing mobile robot applications in python3"
url="https://index.ros.org/p/nav2_simple_commander/"
arch=('any')
makedepends=('python-pytest')
depends=(
    'ros2-humble' 
    'ros2-humble-nav2-msgs'
)
source=("https://github.com/ros-planning/navigation2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('43abfa0eba8e3862e9f69e39399b0b6b627d2fa44faede494b09b7ee8c2626c1')

prepare() {
    source /opt/ros/humble/setup.bash
}

build() {
source /opt/ros/humble/setup.bash
    cd navigation2-$pkgver/$_pkgname
    colcon build --merge-install
}

package() {
    # Copy build files
    mkdir -p $pkgdir/opt/ros/humble
    cp -r $srcdir/navigation2-$pkgver/$_pkgname/install/* $pkgdir/opt/ros/humble/
    # Exclude files that clash with base ros installation
    rm $pkgdir/opt/ros/humble/*setup.*
    rm $pkgdir/opt/ros/humble/_local_setup*
    rm $pkgdir/opt/ros/humble/COLCON_IGNORE
}
