_pkgname=octomap_ros
pkgname=ros2-humble-octomap-ros
pkgver=0.4.3
pkgrel=1
pkgdesc="Provides conversion functions between ROS and OctoMap's native type"
url="https://index.ros.org/p/$_pkgname/"
arch=('any')
depends=('ros2-humble' 'octomap' 'ros2-humble-octomap-msgs')
source=("https://github.com/OctoMap/$_pkgname/archive/refs/tags/ros2_$pkgver.tar.gz")
sha256sums=('873ebeaee306cd940a7ddffe45de86e50bc7678a5b06a571d6b2a4105c07f4f6')

build() {
    source /opt/ros/humble/setup.bash

    cmake -B build -S "$_pkgname-ros2_$pkgver" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
