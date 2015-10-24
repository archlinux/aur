# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=libsoundio
pkgver=1.0.3
pkgrel=2
pkgdesc="A C99 library providing cross-platform audio input and output"
arch=('x86_64')
url='http://www.github.com/andrewrk/libsoundio'
license=('MIT')
source=("https://github.com/andrewrk/${pkgname}/archive/${pkgver}.tar.gz")
options=('!buildflags')
md5sums=('930e15cb9e194ef1f796c73d15823487')

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
        ${srcdir}/${pkgname}-${pkgver}
    make
}

package() {
    make -C ${srcdir}/build install DESTDIR=${pkgdir}
}
