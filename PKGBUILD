# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=wildmidi
pkgname="lib32-$_basename"
pkgver=0.4.2
pkgrel=1
pkgdesc='Open Source MIDI Synthesizer (32-bit)'
arch=('x86_64')
url="http://www.mindwerks.net/projects/wildmidi/"
license=('LGPL3')
depends=('lib32-alsa-lib' 'wildmidi')
makedepends=('cmake')
source=(https://github.com/psi29a/wildmidi/archive/wildmidi-${pkgver}.tar.gz)
sha256sums=('551d43cb6de6019885f933a20b6f3205a92814f50da8b0d8bceac002b9a8109d')

prepare() {
    mkdir build
}

build() {
    cd build

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cmake ../$_basename-$_basename-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr

    make
}

package() {
    cd build

    make DESTDIR="$pkgdir" install

    cd "$pkgdir"/usr

    mv bin/wildmidi bin/wildmidi32
    mv lib lib32
    rm -r share include
}
