# Maintainer: Mahdi Sarikhani <mahdisarikani@outlook.com>
# Contributor: Lukas Werling <lukas@lwrl.de>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=sonobus
pkgver=1.7.2
pkgrel=1
pkgdesc="An easy to use application for streaming high-quality, low-latency peer-to-peer audio"
arch=('i686' 'x86_64' 'aarch64')
url="https://sonobus.net"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'freetype2' 'gcc-libs' 'glibc' 'opus')
makedepends=('cmake' 'jack' 'libx11' 'libxcursor' 'libxinerama' 'libxrandr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sonosaurus/sonobus/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f09954555a281ff254971ef3af5f9d041102143c6454958b15a11a380680a55d')

build() {
    cd "${pkgname}-${pkgver}"
    cmake -B build \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    cd "${pkgname}-${pkgver}/linux"
    install -d "${pkgdir}/usr"
    ./install.sh "${pkgdir}/usr"
}
