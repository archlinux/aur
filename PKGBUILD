# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

pkgname=audiothumbs-frameworks
_commit=d10c667a4a0c437c6115fe04ebe2692e2387676e
pkgver=r5.${_commit:0:7}
pkgrel=1
pkgdesc="Plugin for KDE file managers (Dolphin and Konqueror) to preview cover arts embedded in audio (MP3, FLAC, OGG, M4A) files tags as thumbnails."
arch=('i686' 'x86_64')
url="https://github.com/eplightning/audiothumbs-frameworks"
license=('LGPL')
depends=('taglib' 'kio')
makedepends=('extra-cmake-modules' 'flac')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/${_commit}.tar.gz")
sha256sums=('2287599023e04f37b8aecdc07796162a10e9ae8ecbd28e6b6efa371ec0e96b0a')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake "../${pkgname}-${_commit}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
