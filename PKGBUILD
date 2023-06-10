# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=geometric_shapes
pkgname=ros2-humble-geometric-shapes
pkgver=2.1.3
pkgrel=4
pkgdesc="This package contains generic definitions of geometric shapes and bodies."
url="https://index.ros.org/p/geometric_shapes/"
arch=('any')
makedepends=(
    'pkgconf'
    'cmake'
    'boost'
)
depends=(
    'ros2-humble'
    'ros2-humble-eigen-stl-containers'
    'console-bridge'
    'qhull'
    'ros2-humble-random-numbers'
    'assimp'
    'boost-libs'
)
source=("https://github.com/ros-planning/geometric_shapes/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5ee0fcdd9bea23d78842285a21c339c3dca624f1740f2d433b9cc94b64d61ebf')


build() {
    source /opt/ros/humble/setup.bash

    cmake -B build -S "$_pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
