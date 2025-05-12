# Maintainer: Kodate Mitsuru <hh178239456@gmail.com>
# Contributor: Kino <cybao292261@163.com>
# Contributor: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=control_msgs
_pkgname=control_msgs
pkgname=ros2-jazzy-control_msgs
pkgver=5.4.0
pkgrel=1
pkgdesc="control_msgs contains base messages and actions useful for controlling robots. It provides representations for controller setpoints and joint and cartesian trajectories."
url="https://github.com/ros-controls/control_msgs"
license=('BSD-3-Clause')
arch=('any')
makedepends=('cmake')
depends=('ros2-jazzy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ros-controls/control_msgs/archive/${pkgver}.tar.gz")
sha256sums=('0cf3b1cdf907df3f9dd0810e483ea50d906cec1f55fd93db6bb2acb8e82e8934')

prepare() {
  mkdir -p $srcdir/build
  cd $srcdir/build
  source /opt/ros/jazzy/setup.bash
  python -m venv venv/opt/ros/jazzy --system-site-packages
}

build() {
  source build/venv/opt/ros/jazzy/bin/activate
  cmake -B build -S "$_pkgroot-$pkgver/$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/jazzy/' \
        -Wno-dev
  cmake --build build
  deactivate
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $srcdir/$_pkgroot-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}