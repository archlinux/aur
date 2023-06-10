# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=generate_parameter_library
_pkgname=generate_parameter_library_py
pkgname=ros2-humble-generate-parameter-library-py
pkgver=0.3.3
pkgrel=2
pkgdesc="Python library for loading parameters in launch files"
url="https://index.ros.org/p/launch_param_builder/"
arch=('any')
makedepends=(python-build python-installer python-wheel)
depends=(
    'ros2-humble'
    'python'
    'python-jinja'
    'python-typeguard'
    'python-yaml'
)
source=("https://github.com/PickNikRobotics/generate_parameter_library/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f1fd0bd411191a68ce70833c97aa0925525951127709819eb00e7a4007f5447e')


build() {
    source /opt/ros/humble/setup.bash

    cd "$_pkgroot-$pkgver/$_pkgname"
    python -m build --wheel --no-isolation 
}

package() {
    cd "$_pkgroot-$pkgver/$_pkgname"
    python -m installer --destdir="$pkgdir" --prefix="/opt/ros/humble" dist/*.whl
}
