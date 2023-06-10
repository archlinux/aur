# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=teleop_tools
_pkgname=joy_teleop
pkgname=ros2-humble-joy-teleop
pkgver=1.3.0
pkgrel=4
pkgdesc="A (to be) generic joystick interface to control a robot"
url="https://index.ros.org/p/joy_teleop/"
arch=('any')
depends=(
    'ros2-humble' 
    'ros2-humble-control-msgs'
    'ros2-humble-teleop-tools-msgs'
)
makedepends=(python-build python-installer python-wheel)
source=("https://github.com/ros-teleop/teleop_tools/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('902e5fbdec909ee66e1b428df5076f125c231361211a1bd2a10b933fbc4d1f85')


build() {
    source /opt/ros/humble/setup.bash

    cd "$_pkgroot-$pkgver/$_pkgname"
    python -m build --wheel --no-isolation 
}

package() {
    cd "$_pkgroot-$pkgver/$_pkgname"
    python -m installer --destdir="$pkgdir" --prefix="/opt/ros/humble" dist/*.whl
}
