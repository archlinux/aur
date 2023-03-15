# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=diagnostic_updater
pkgname=ros2-humble-diagnostic-updater
pkgver=3.1.0
pkgrel=2
pkgdesc="diagnostic_updater contains tools for easily updating diagnostics"
url="https://index.ros.org/p/diagnostic_updater/"
arch=('any')
depends=(
    'ros2-humble' 
)
source=("https://github.com/ros/diagnostics/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('70eab1c02b0eb113f35ae84d300bc2c510c015a16961ee4c95449ccd3d20a188')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S diagnostics-$pkgver/$_pkgname -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
source /opt/ros/humble/setup.bash
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
