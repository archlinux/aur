# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=libsoundio
pkgver=2.0.0
pkgrel=1
pkgdesc="A C99 library providing cross-platform audio input and output"
arch=('i686' 'x86_64')
url='https://www.github.com/andrewrk/libsoundio'
license=('MIT')
source=("https://github.com/andrewrk/$pkgname/archive/$pkgver.tar.gz")
options=('!buildflags')
depends=('jack')
makedepends=('cmake')
md5sums=('1ff5b669b72af353a910208324d9d6ac')

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
