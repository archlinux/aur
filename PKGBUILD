# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributors: jdc, rayman2200, TheCycoONE

pkgname=corsix-th
pkgver=0.64
pkgrel=1
pkgdesc='Reimplementation of the game engine of Theme Hospital'
url='https://github.com/CorsixTH/CorsixTH'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('cmake' 'ninja')
depends=('lua53' 'lua53-lpeg' 'lua53-filesystem' 'sdl2_mixer' 'ffmpeg')
optdepends=('freepats-legacy: Soundfont for Midi playback'
            'soundfont-fluid: Alternative soundfont for Midi playback')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/CorsixTH/CorsixTH/archive/v$pkgver.tar.gz")
sha256sums=('12389a95de0031baec1a3fc77208d44228177f49564f1c79ae763ab4aeeafa98')

prepare() {
  rm -rf th
  mkdir th
}

build() {
  cmake -B th -G Ninja -DCMAKE_BUILD_TYPE=Release -Wno-dev \
        -DLUA_INCLUDE_DIR=/usr/include/lua5.3 -DLUA_LIBRARY=/usr/lib/liblua5.3.so \
        -DCMAKE_INSTALL_PREFIX=/usr CorsixTH-$pkgver
  cmake --build th
}

package() {
  DESTDIR="$pkgdir/" cmake --install th
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/share/corsix-th/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/
}
