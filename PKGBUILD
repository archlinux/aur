# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=behaviortree-cpp-v3
pkgname=ros2-humble-$_pkgname
pkgver=3.8.3
pkgrel=1
pkgdesc="Behavior Trees Library in C++. Batteries included."
url="https://index.ros.org/p/behaviortree_cpp/"
arch=('any')
depends=(
    'ros2-humble'
    'boost'
    'zeromq'
    'ncurses'
)
source=("https://github.com/BehaviorTree/BehaviorTree.CPP/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5dd782cc73913b0bfe26adb6fe3d7c10f1e2063a0a994bcba4d4e2ac86470196')

prepare() {
    sed -i 's/CMAKE_CXX_STANDARD 14/CMAKE_CXX_STANDARD 17/g' BehaviorTree.CPP-$pkgver/CMakeLists.txt

    source /opt/ros/humble/setup.bash

    cmake -S BehaviorTree.CPP-$pkgver -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
