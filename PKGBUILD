# Maintainer: Lukas Werling <lukas@lwrl.de>
# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=sonobus
pkgver=1.4.9
pkgrel=1
pkgdesc="An easy to use application for streaming high-quality, low-latency peer-to-peer audio"
arch=('i686' 'x86_64' 'aarch64')
url="https://sonobus.net"
license=('GPL3')
depends=('opus' 'freetype2' 'libxrandr' 'libxinerama' 'libxcursor' 'libasound.so=2-64' 'libjack.so=0-64')
makedepends=('cmake')
source=("sonobus-$pkgver::https://github.com/sonosaurus/sonobus/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('50ed4e895aa592e6868405ba25a09d00280e8989e844b3e0711dd6f6950d176902a6a4c5aa9496e2de31f4a3ba378b97b8d1ab3be99f9810a56eea1a1182f210')

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
