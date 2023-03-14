# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=urdf_parser_py
pkgname=ros2-humble-urdf-parser-py
pkgver=1.2.0
pkgrel=1
pkgdesc="Python implementation of the URDF parser"
url="https://index.ros.org/p/urdf_parser_py/"
arch=('any')
makedepends=('python-mock')
depends=(
    'ros2-humble'
    'python-lxml'
    'python-yaml'
)
source=("https://github.com/ros/urdf_parser_py/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ea7ca336bf0e7d47048769634eb3ca63fc773cbdeef8ed2a7c38230151cc3b45')

prepare() {
    source /opt/ros/humble/setup.bash
}

build() {
    cd urdf_parser_py-$pkgver
    colcon build --merge-install
}

package() {
    # Copy build files
    mkdir -p $pkgdir/opt/ros/humble
    cp -r $srcdir/urdf_parser_py-$pkgver/install/* $pkgdir/opt/ros/humble/
    # Exclude files that clash with base ros installation
    rm $pkgdir/opt/ros/humble/*setup.*
    rm $pkgdir/opt/ros/humble/_local_setup*
    rm $pkgdir/opt/ros/humble/COLCON_IGNORE
}
