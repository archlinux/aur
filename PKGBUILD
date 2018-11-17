# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas
pkgver=1.3.2
pkgrel=1
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'freetype2'
         'qt5-base' 'xcb-util-cursor' 'zlib')
makedepends=('cmake' 'extra-cmake-modules')
source=("${url}/archive/v${pkgver}.tar.gz"
        linTAS.desktop)
sha512sums=('f5bd220aff03987933d70be3c560b1af10c50018fb42740f32930dac2836f53b80b6bb46e03e5211b4f9c157e6a1e7b44ae8a5c1644e977389aeb5caece16c89'
            '7002415aaa670e7cbee27ef8031bb0f61a6f3182212b435270e47a3567ff45fe0d98db92a7798fa1d3573a07627d224a8ba645c5503b7f03663f9eef545aab40')

build() {
  cd "libTAS-$pkgver"

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "libTAS-$pkgver/build"

  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/linTAS.desktop" "$pkgdir/usr/share/applications/linTAS.desktop"
}
