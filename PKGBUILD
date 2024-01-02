# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Mark Lee <mark@markelee.com>

pkgname=mediastreamer
pkgver=5.3.5
pkgrel=1
pkgdesc='A library written in C that allows you to create and run audio and video streams'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(AGPL3)
depends=(bcmatroska2 bcg729 bzrtp ffmpeg4.4 glew libsrtp libyuv ortp zxing-cpp)
makedepends=(cmake python bcunit doxygen)
source=(https://gitlab.linphone.org/BC/public/${pkgname}2/-/archive/$pkgver/${pkgname}2-$pkgver.tar.bz2)
sha256sums=('77c9d8d5cd2b599a6968b5f9a459ffc248b03b657cb004451b122fe8d853b7e9')

build() {
  cmake -B build -S ${pkgname}2-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_STRICT=OFF \
    -DENABLE_UNIT_TESTS=OFF \
    -DENABLE_MKV=ON \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/include/OpenGL
}
