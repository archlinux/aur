# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=pal_gazebo_plugins
pkgname=ros2-humble-pal-gazebo-plugins
pkgver=4.0.4
pkgrel=5
pkgdesc="Common Gazebo v1.9+ plugins used by the PAL Robotics robots"
url="https://github.com/pal-robotics/pal_gazebo_plugins/"
arch=('any')
depends=(
    'ros2-humble'
    'ros2-humble-gazebo-dev'
    'ros2-humble-gazebo-ros'
    'ros2-humble-gazebo-msgs'
    'ros2-humble-control-toolbox'
)
makedepends=('cmake')
source=("https://github.com/pal-robotics/pal_gazebo_plugins/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a81cd4cd89b68a18917289590708656cac5e41c654991f5dd094960452a1fe90')


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
