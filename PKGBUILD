# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=libsoundio
pkgver=2.0.1
_pkgver=$pkgver-7
pkgrel=3
pkgdesc='A C99 library providing cross-platform audio input and output'
arch=('i686' 'x86_64')
url='https://www.github.com/andrewrk/libsoundio'
license=('MIT')
source=("https://github.com/andrewrk/$pkgname/archive/$_pkgver.tar.gz")
depends=('jack')
makedepends=('cmake')
md5sums=('7a8d22fc28a5331e26ed318283f40d96')

build() {
  cmake \
    -B build \
    -S "$pkgname-$_pkgver" \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D BUILD_EXAMPLE_PROGRAMS=OFF \
    -D BUILD_TESTS=OFF \
    -D BUILD_STATIC_LIBS=OFF \
    -D ENABLE_JACK=ON \
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5 \

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$pkgname-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
