# Maintainer: Lukas Werling <lukas@lwrl.de>
# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=sonobus
pkgver=1.5.1
pkgrel=1
pkgdesc="An easy to use application for streaming high-quality, low-latency peer-to-peer audio"
arch=('i686' 'x86_64' 'aarch64')
url="https://sonobus.net"
license=('GPL3')
depends=('opus' 'freetype2' 'libxrandr' 'libxinerama' 'libxcursor' 'libasound.so=2-64' 'libjack.so=0-64')
makedepends=('cmake')
source=("sonobus-$pkgver::https://github.com/sonosaurus/sonobus/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('329ef7c4b3bfe391673c5af871a2fdf688514f443550303ee7d83c3e25864fd4782ce1fe36f9fdf67d82a9964f566cb095b94d1165b66a7b705c558d2661a47a')

build() {
    cd "sonobus-${pkgver}"

    cmake -B build  \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
    cd "sonobus-${pkgver}/linux"

    install -d "$pkgdir/usr"

    ./install.sh "$pkgdir/usr"
}
