# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-media-player
pkgver=1.7.1
pkgrel=3
pkgdesc='Jellyfin Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/jellyfin/jellyfin-media-player'
depends=('mpv' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt5-webengine' 'qt5-x11extras' 'qt5-quickcontrols')
makedepends=('cmake' 'git' 'python')
source=("https://github.com/jellyfin/jellyfin-media-player/archive/refs/tags/v${pkgver}.tar.gz"
        'jwc-10.8.1.tar.gz::https://github.com/iwalton3/jellyfin-web-jmp/releases/download/jwc-10.8.1/dist.zip')
sha256sums=('5139cf7128673c053fcc5db7158ee696ccfd7623e133a21c9a2377b66a37efb3'
            '3f754d5ae77013d1e44801850daf6aa0ae46256cabe5afaa1c9b854813a2c0d6')

build() {
    cd "${srcdir}/jellyfin-media-player-${pkgver}"
    mkdir -p build
    cd build
    cp -r "${srcdir}/dist" .
    cmake \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr/' \
        -DCMAKE_SKIP_RPATH=1 \
        -DLINUX_X11POWER=ON \
        -DQTROOT=./qt \
        ..
    make
}

package() {
    cd "${srcdir}/jellyfin-media-player-${pkgver}/build"
    DESTDIR="${pkgdir}" make install
}
