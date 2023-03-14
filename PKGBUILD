# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

pkgname=ros2-humble-moveit-msgs
pkgver=2.2.1
pkgrel=1
pkgdesc="Messages, services and actions used by MoveIt"
url="https://index.ros.org/p/moveit_msgs/"
arch=('any')
depends=(
    'ros2-humble'
    'ros2-humble-object-recognition-msgs'
    'ros2-humble-octomap-msgs'
)
source=("https://github.com/ros-planning/moveit_msgs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('19fe10af4ab1e236206886c66824beab1bfe9e295d37a2a47c51b65c5199b4aa')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S moveit_msgs-$pkgver -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
