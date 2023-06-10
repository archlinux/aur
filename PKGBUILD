# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

pkgname=ros2-humble-moveit-msgs
pkgver=2.2.2
pkgrel=1
pkgdesc="Messages, services and actions used by MoveIt"
url="https://index.ros.org/p/moveit_msgs/"
arch=('any')
depends=(
    'ros2-humble'
    'ros2-humble-object-recognition-msgs'
    'ros2-humble-octomap-msgs'
)
makedepends=('cmake')
source=("https://github.com/ros-planning/moveit_msgs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('aa24e058bce0a81de7baf8be7af40121983e7b143aaa1b7cffb11e25d16abe51')

prepare() {
    source /opt/ros/humble/setup.bash
}

build() {
    cmake -B build -S "$_pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
