# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-media-player
pkgver=1.8.1
pkgrel=1
pkgdesc='Jellyfin Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/jellyfin/jellyfin-media-player'
depends=('mpv' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt5-webengine' 'qt5-x11extras' 'qt5-quickcontrols')
makedepends=('cmake' 'git' 'python')
source=("https://github.com/jellyfin/jellyfin-media-player/archive/refs/tags/v${pkgver}.tar.gz"
        'jwc-10.8.9.tar.gz::https://github.com/iwalton3/jellyfin-web-jmp/releases/download/jwc-10.8.9/dist.zip')
sha256sums=('63e3b7f60d1b165b6a79adc179e9529fdae63219feb79a91b609cc59c4959ce7'
            '4f81cfaf6e8df312aca44a194e23882ebae78f65d98853afa3ec7aceb22d29fa')

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
