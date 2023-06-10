# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=moveit2
_pkgname=moveit_configs_utils
pkgname=ros2-humble-moveit-configs-utils
pkgver=2.5.4
pkgrel=4
pkgdesc="Python library for loading moveit config parameters in launch files"
url="https://index.ros.org/p/moveit_configs_utils/"
arch=('any')
depends=(
    'ros2-humble'
    'ros2-humble-launch-param-builder'
    'ros2-humble-srdfdom'
)
makedepends=(python-build python-installer python-wheel)
source=("https://github.com/ros-planning/moveit2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('42ac45e2631d59203edfdfc2f521312f7ddef04ff5baf1fec43c65f79495d7a6')


build() {
    source /opt/ros/humble/setup.bash

    cd "$_pkgroot-$pkgver/$_pkgname"
    python -m build --wheel --no-isolation 
}

package() {
    cd "$_pkgroot-$pkgver/$_pkgname"
    python -m installer --destdir="$pkgdir" --prefix="/opt/ros/humble" dist/*.whl
}
