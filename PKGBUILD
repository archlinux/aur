# $Id$
# Contributor: Ivailo Monev <xakepa10@gmail.com>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Fabian Kosmale <0inkane@googlemail.com>
# Contributor: Giuseppe Calà <jiveaxe@gmail.com>
# Contributor: alejandronova

# Based on Katana's project PKGBUILD by Ivailo Monev

pkgname=strigi
pkgver=0.8.0.r18.e017dc9
pkgrel=1
pkgdesc="File indexing and file search framework adopted by KDE"
arch=('i486' 'i686' 'pentium4' 'x86_64' 'arm')
url='http://fluxer.github.io/katana/'
license=('LGPL')
depends=('ffmpeg' 'exiv2')
makedepends=('cmake' 'git')
source=("git+https://github.com/fluxer/strigi.git")
sha1sums=('SKIP')

export CFLAGS="${CFLAGS} -flto" CXXFLAGS="${CXXFLAGS} -flto"

pkgver() {
    cd strigi
    printf "0.8.0."r%s.%s "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../strigi \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
