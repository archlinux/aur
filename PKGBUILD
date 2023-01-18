# Maintainer: Lukas Werling <lukas@lwrl.de>
# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=sonobus
pkgver=1.6.1
pkgrel=1
pkgdesc="An easy to use application for streaming high-quality, low-latency peer-to-peer audio"
arch=('i686' 'x86_64' 'aarch64')
url="https://sonobus.net"
license=('GPL3')
depends=('opus' 'freetype2' 'libxrandr' 'libxinerama' 'libxcursor' 'libasound.so=2-64' 'libjack.so=0-64')
makedepends=('cmake')
source=("sonobus-$pkgver.tar.gz::https://github.com/sonosaurus/sonobus/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('9d36cac621dbc2a3cd12299f22a5407e5978e02a6a67c9af7fad2e53bfb1250c71611ed08fb294e6df5e324ae59fd27c9e489b17693dc676c5d170aef5ca734c')

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
