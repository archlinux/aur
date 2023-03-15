# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

pkgname=ros2-humble-octomap-msgs-git
provides=('ros2-humble-octomap-msgs')
pkgver=2.0.0.r58.67be62d
pkgrel=2
pkgdesc="Messages, services and actions used by MoveIt"
url="https://index.ros.org/p/octomap_msgs/"
arch=('any')
depends=(
    'ros2-humble'
)
source=("git+https://github.com/OctoMap/octomap_msgs.git#branch=ros2")
sha256sums=('SKIP')

prepare() {
    cd $srcdir/octomap_msgs
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    
    source /opt/ros/humble/setup.bash

    cd ..
    cmake -S octomap_msgs -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
source /opt/ros/humble/setup.bash
    source /opt/ros/humble/setup.bash
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
