# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=plotjuggler-git
pkgver=3.16.0.r92.g8704e452
pkgrel=1
pkgdesc="The Time Series Visualization Tool that you deserve. Without ROS dependencies."
arch=('x86_64')
url="https://github.com/facontidavide/PlotJuggler"
license=('MPL-2.0')
depends=(
    'arrow'
    'binutils'
    'fmt'
    'lua'
    'mosquitto'
    'nlohmann-json'
    'protobuf'
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
    'git'
)
provides=('plotjuggler')
conflicts=('plotjuggler')
source=(
    'git+https://github.com/facontidavide/PlotJuggler.git'
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd PlotJuggler
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "PlotJuggler"
    cmake -S . -B build \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
    cmake --build build
}

package() {
    cd "PlotJuggler"
    DESTDIR="${pkgdir}" cmake --install build
}
