# Maintainer: Sahan Fernando <sahan.h.fernando@gmail.com>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>

_pkgname=libsoundio
pkgname=${_pkgname}-git
pkgver=1.0.3.0.g581c5a4
pkgrel=1
pkgdesc='A C99 library providing cross-platform audio input and output'
arch=('x86_64')
url='http://www.github.com/andrewrk/libsoundio'
license=('MIT')
source=('git://github.com/andrewrk/libsoundio')
options=('!buildflags')
provides=('libsoundio')
conflicts=('libsoundio')
md5sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long | sed -e 's/-/./g'
}

build() {
    cd ${srcdir}
    mkdir -p build
    cd build
    cmake \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_INSTALL_LIBDIR=lib \
        -D BUILD_EXAMPLE_PROGRAMS=OFF \
        -D BUILD_TESTS=OFF \
        -D BUILD_STATIC_LIBS=OFF \
        -D ENABLE_JACK=OFF \
        ${srcdir}/${_pkgname}
    make
}

package() {
    make -C ${srcdir}/build install DESTDIR=${pkgdir}
}
