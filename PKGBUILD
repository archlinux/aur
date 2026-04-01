# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-desktop
pkgver=2.0.0
pkgrel=3
pkgdesc='Jellyfin Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/jellyfin/jellyfin-desktop'
depends=('mpv' 'mpvqt' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt6-webengine' 'qt6-declarative')
makedepends=('cmake' 'git' 'ninja' 'python')
source=("https://github.com/jellyfin-archive/jellyfin-desktop-qt/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('11ba0a7f4f344dc076b9f234193f93684a5621a100607298dfc2d14092b525d5')

build() {
    cd "${srcdir}/jellyfin-desktop-qt-${pkgver}"
    rm -rf build
    mkdir build
    cmake \
        -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr/' \
        -DCMAKE_SKIP_RPATH=1 \
        -DQTROOT=build/qt \
        -Wno-dev
    cmake --build build
}

package() {
    cd "${srcdir}/jellyfin-desktop-qt-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
}
