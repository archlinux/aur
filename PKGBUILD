# Maintainer: Lukas Werling <lukas@lwrl.de>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=sonobus
pkgver=1.4.5
pkgrel=1
pkgdesc="An easy to use application for streaming high-quality, low-latency peer-to-peer audio"
arch=('i686' 'x86_64')
url="https://sonobus.net"
license=('GPL3')
depends=('opus' 'curl' 'freetype2' 'libxrandr' 'libxinerama' 'libxcursor' 'libgl' 'libasound.so=2-64' 'libjack.so=0-64')
makedepends=()
source=("https://github.com/essej/sonobus/archive/${pkgver}.tar.gz")
sha512sums=('87ca346a6a9ca62d8efe1824b820a856374ed875e9e4eb3aa8b47a3d8ff233b2daa8cc81105fd2a51bfb6969becafd60a84b1947611952063ff389389980d37b')

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
