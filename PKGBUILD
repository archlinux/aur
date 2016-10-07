# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

pkgname=audiothumbs-frameworks
pkgver=r5.d10c667
pkgrel=1
pkgdesc="Plugin for KDE file managers (Dolphin and Konqueror) to preview cover arts embedded in audio (MP3, FLAC, OGG, M4A) files tags as thumbnails."
arch=('i686' 'x86_64')
url="https://github.com/eplightning/audiothumbs-frameworks"
license=('LGPL')
depends=('taglib' 'kio')
makedepends=('extra-cmake-modules' 'flac')
source=(${pkgname}-${pkgver}.zip::'https://github.com/eplightning/audiothumbs-frameworks/archive/master.zip')
sha256sums=('56dce4bbef509db6e7b2a63d00dfa5115634529876d9418076d0b9c1a7afd57d')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake "../${pkgname}-master" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
