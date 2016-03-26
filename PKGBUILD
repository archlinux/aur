# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=libsoundio
pkgver=1.1.0
pkgrel=3
pkgdesc="A C99 library providing cross-platform audio input and output"
arch=('x86_64')
url='http://www.github.com/andrewrk/libsoundio'
license=('MIT')
source=("https://github.com/andrewrk/$pkgname/archive/$pkgver.tar.gz")
options=('!buildflags')
depends=('jack2')
md5sums=('989d1daf6e9f4b629a4f8f5329c8e21c')

build() {
    mkdir -p "$pkgname-$pkgver.build"
    cd "$pkgname-$pkgver.build"
    cmake \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_INSTALL_LIBDIR=lib \
        -D BUILD_EXAMPLE_PROGRAMS=OFF \
        -D BUILD_TESTS=OFF \
        -D BUILD_STATIC_LIBS=OFF \
        -D ENABLE_JACK=ON \
        "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    make \
        -C "$pkgname-$pkgver.build" \
        install DESTDIR="$pkgdir"
}
