# Maintainer: Lukas Werling <lukas@lwrl.de>
# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=sonobus
pkgver=1.4.6
pkgrel=1
pkgdesc="An easy to use application for streaming high-quality, low-latency peer-to-peer audio"
arch=('i686' 'x86_64')
url="https://sonobus.net"
license=('GPL3')
depends=('opus' 'freetype2' 'libxrandr' 'libxinerama' 'libxcursor' 'libasound.so=2-64' 'libjack.so=0-64')
makedepends=('cmake')
source=("https://github.com/essej/sonobus/archive/${pkgver}.tar.gz")
sha512sums=('4e21d1248a3cfd023d95de711c4c11c333cead6903e9819ae0450346013a0121544246a7c6c9fe3cc36fec6130924df2640458877ba6eb1d0a5018eaf120e266')

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
