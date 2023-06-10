# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=urdf_parser_py
pkgname=ros2-humble-urdf-parser-py
pkgver=1.2.1
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
makedepends=(python-build python-installer python-wheel)
source=("https://github.com/ros/urdf_parser_py/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ea7ca336bf0e7d47048769634eb3ca63fc773cbdeef8ed2a7c38230151cc3b45')

prepare() {
    source /opt/ros/humble/setup.bash   
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation 
}

package() {
    cd "$_pkgroot-$pkgver/$_pkgname"
    python -m installer --destdir="$pkgdir" --prefix="/opt/ros/humble" dist/*.whl
}
