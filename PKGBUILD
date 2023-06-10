# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=twist_mux
pkgname=ros2-humble-twist-mux
pkgver=4.1.0
pkgrel=4
pkgdesc="Twist multiplexer, which multiplex several velocity commands (topics) and allows to priorize or disable them (locks)."
url="https://index.ros.org/p/twist_mux/"
arch=('any')
depends=(
    'ros2-humble' 
    'ros2-humble-diagnostic-updater'
)
makedepends=('cmake')
source=("https://github.com/ros-teleop/twist_mux/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('74df6cc84a9f24c7c794a4a7902b06683b535ffd4f9894b9fc663ab9d8fb01d4')


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
