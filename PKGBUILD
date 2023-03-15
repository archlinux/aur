# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=generate_parameter_library_py
pkgname=ros2-humble-generate-parameter-library-py
pkgver=0.3.1
pkgrel=2
pkgdesc="Python library for loading parameters in launch files"
url="https://index.ros.org/p/launch_param_builder/"
arch=('any')
makedepends=(
    'python-pytest'
)
depends=(
    'ros2-humble'
    'python'
    'python-jinja'
    'python-typeguard'
    'python-yaml'
)
source=("https://github.com/PickNikRobotics/generate_parameter_library/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1b0a4a2e30518ac3b416798cc593edfe1ec488d0c1ab05dbb31ae40c28f1edec')

prepare() {
    source /opt/ros/humble/setup.bash   
}

build() {
source /opt/ros/humble/setup.bash
    cd generate_parameter_library-$pkgver/$_pkgname
    colcon build --merge-install
}

package() {
    # Copy build files
    mkdir -p $pkgdir/opt/ros/humble
    cp -r $srcdir/generate_parameter_library-$pkgver/$_pkgname/install/* $pkgdir/opt/ros/humble/
    # Exclude files that clash with base ros installation
    rm $pkgdir/opt/ros/humble/*setup.*
    rm $pkgdir/opt/ros/humble/_local_setup*
    rm $pkgdir/opt/ros/humble/COLCON_IGNORE
}
