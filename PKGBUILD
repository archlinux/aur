# Maintainer: Sahan Fernando <sahan.h.fernando@gmail.com>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>

_pkgname=libsoundio
pkgname=${_pkgname}-git
pkgver=1.0.2.1.g0a0715e
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
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DENABLE_JACK=OFF \
        ${srcdir}/${_pkgname}
    make
}

package() {
    make -C ${srcdir}/build install DESTDIR=${pkgdir}
}
