# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=soundtouch
pkgname=lib32-$_pkgname
pkgver=2.3.2
pkgrel=1
pkgdesc='An open-source audio processing library for changing the tempo, pitch and playback rates of audio streams or audio files (32 bit)'
arch=('x86_64')
url='https://www.surina.net/soundtouch'
license=('LGPL2.1')
depends=('lib32-gcc-libs' $_pkgname)
makedepends=('cmake' 'git' 'ninja')
source=("git+https://codeberg.org/$_pkgname/$_pkgname.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd ${srcdir}

    cmake -S ${_pkgname} -B build -G Ninja \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_CXX_FLAGS_RELEASE='-m32 -DNDEBUG' \
        -DCMAKE_INSTALL_LIBDIR=lib32
    cmake --build build
}

package() {
    cd ${srcdir}

    DESTDIR="${pkgdir}" cmake --install build
    rm -rf "${pkgdir}"/usr/{bin,doc,include,share}
}
