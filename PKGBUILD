# Maintainer: João Freitas <joaj.freitas at gmail dot com>
# Co-maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=plotjuggler
pkgver='3.17.2'
pkgrel=1
pkgdesc="The Time Series Visualization Tool that you deserve. Without ROS dependencies."
arch=('x86_64')
url="https://github.com/PlotJuggler/PlotJuggler"
license=('MPL-2.0')
depends=(
    'arrow'
    'binutils'
    'fmt'
    'lua'
    'mosquitto'
    'nlohmann-json'
    'protobuf'
    'python'
    'qt5-base'
    'qt5-multimedia'
    'qt5-serialport'
    'qt5-svg'
    'qt5-websockets'
    'qt5-x11extras'
    'zeromq'
)
makedepends=(
    'cmake'
    'clang'
)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/PlotJuggler/PlotJuggler/archive/${pkgver}.tar.gz")
sha256sums=('893212172f9e6534132e3f791cd3c57bb5542d494ce22b3756a8e4d48e6bfa21')

build() {
    cd "PlotJuggler-${pkgver}"
    cmake -S . -B build \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
    cmake --build build
}

package() {
    cd "PlotJuggler-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
}
