# Maintainer: Tong Chunli <tty2099@gmail.com>

pkgname=mqtt_cpp
pkgver=11.1.0
pkgrel=1
pkgdesc='mqtt_cpp is a header only library.It supports MQTT v5'
arch=('x86_64')
url='https://github.com/redboltz/mqtt_cpp'
license=('BOOST')
depends=('doxygen')
makedepends=('cmake')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/redboltz/mqtt_cpp/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('5a44149dd90f6e0f62a45a4ed9dfa8d4171185a6047d5735186837bf264aabce')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMQTT_BUILD_EXAMPLES=OFF \
        -DMQTT_BUILD_TESTS=OFF \
        -DMQTT_USE_TLS=ON \
        -DMQTT_USE_WS=ON \
        -DMQTT_USE_LOG=ON \
        -DMQTT_STD_VARIANT=ON \
        -DMQTT_STD_OPTIONAL=ON \
        -DMQTT_STD_STRING_VIEW=ON \
        -DMQTT_STD_ANY=ON \
        -DMQTT_STD_SHARED_PTR_ARRAY=ON
    make -C build
}


package() {
    make -C build DESTDIR="$pkgdir" install
}
