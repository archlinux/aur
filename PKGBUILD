# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=lib32-libtas
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries (32-bit support)"
pkgver=1.4.5
pkgrel=1
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('lib32-alsa-lib' 'lib32-ffmpeg' 'lib32-fontconfig'
         'lib32-freetype2' 'lib32-libx11' 'lib32-sdl2' 'libtas' 'lib32-zlib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('9a3de2850cdfefb380a2e913dc83f45d2c7b7d4d42743fddf7a07f27f2eacb7baa580d182ea8a634b436c57359f2e8cd61a5de804e6843fb3fd92c003f69509a')

prepare() {
  cd "libTAS-$pkgver"

  autoreconf -i
}

build() {
  cd "libTAS-$pkgver"

  ./configure --prefix=/usr --enable-i386-lib
  make
}

package() {
  cd "libTAS-$pkgver"

  make DESTDIR="$pkgdir/" install
}
