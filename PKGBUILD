# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=octomap_msgs
pkgname=ros2-humble-octomap-msgs-git
provides=('ros2-humble-octomap-msgs')
pkgver=2.0.0.r58.67be62d
pkgrel=5
pkgdesc="Messages, services and actions used by MoveIt"
url="https://index.ros.org/p/octomap_msgs/"
arch=('any')
depends=(
    'ros2-humble'
)
makedepends=('cmake')
source=("git+https://github.com/OctoMap/octomap_msgs.git#branch=ros2")
sha256sums=('SKIP')

prepare() {
    cd $srcdir/$_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    source /opt/ros/humble/setup.bash

    cmake -B build -S "$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
