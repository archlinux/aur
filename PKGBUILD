# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas-git
pkgver=1.3.1.r54.9351ce3
pkgrel=1
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'freetype2'
         'libtar' 'qt5-base' 'xcb-util-cursor' 'zlib')
makedepends=('cmake' 'extra-cmake-modules')
conflicts=('libtas')
source=("git+$url"
        linTAS.desktop)
sha512sums=(SKIP
            '7002415aaa670e7cbee27ef8031bb0f61a6f3182212b435270e47a3567ff45fe0d98db92a7798fa1d3573a07627d224a8ba645c5503b7f03663f9eef545aab40')

pkgver() {
  cd "libTAS"

  printf %s "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g')"
}

build() {
  cd "libTAS"

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "libTAS/build"

  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/linTAS.desktop" "$pkgdir/usr/share/applications/linTAS.desktop"
}
