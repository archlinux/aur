# Maintainer: João Freitas <joaj.freitas at gmail dot com>
# Co-maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=plotjuggler
pkgver='3.16.0'
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
    'qt5-svg'
    'qt5-websockets'
    'qt5-x11extras'
    'zeromq'
)
makedepends=(
    'cmake'
    'clang'
)
source=(
    "${pkgname}-${pkgver}.tar.gz"::"https://github.com/facontidavide/PlotJuggler/archive/${pkgver}.tar.gz"
)
sha256sums=('abe9ca652773918c4aa30abc952ff3311e81357b4ee5956c8898cb7f04ab3964')

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
