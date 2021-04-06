# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-media-player
pkgver=1.2.1
pkgrel=1
pkgdesc='Jellyfin Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/iwalton3/jellyfin-media-player'
depends=('mpv' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt5-webengine' 'qt5-x11extras' 'qt5-quickcontrols')
makedepends=('cmake' 'git')
source=("https://github.com/iwalton3/jellyfin-media-player/archive/refs/tags/v${pkgver}.tar.gz"
        'https://github.com/iwalton3/jellyfin-web-jmp/releases/download/jwc-1.7.0-3/dist.zip')
sha256sums=('77f8dfe427992c6ee4df09e257798cd15734c4afcaad211959605f63edef8fb1'
            '4a79a6210fe0d3300da947086a6ec07f45993fffc771789c645bfac05f2cf08a')

build() {
    cd "${srcdir}/jellyfin-media-player-${pkgver}"
    mkdir -p build
    cd build
    cp -r "${srcdir}/dist" .
    cmake -DCMAKE_INSTALL_PREFIX='/usr/' -DCMAKE_BUILD_TYPE='Release' -DQTROOT=./qt -DCMAKE_SKIP_RPATH=1 ..
    make
}

package() {
    cd "${srcdir}/jellyfin-media-player-${pkgver}/build"
    DESTDIR="${pkgdir}" make install
}
