# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributors: jdc, rayman2200, TheCycoONE

pkgname=corsix-th
pkgver=0.61
pkgrel=1
pkgdesc='Reimplementation of the game engine of Theme Hospital'
url='https://github.com/CorsixTH/CorsixTH'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('cmake')
depends=('lua' 'lua-lpeg' 'lua-filesystem' 'sdl2_mixer' 'ffmpeg' 'timidity-freepats')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/CorsixTH/CorsixTH/archive/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('b8e19743cd499436dce58af67479997e621fe50e21e31f08f440d2303e11f5d6'
            '3614197a30498774fff4055ee54d82a812a8b88eba353b70c3288a09ff700158'
            'f802f8acdc8b3d0370344c608b780620f83a21f04bdf32507466adb4222ba4bc')

build() {
  cd CorsixTH-$pkgver

  cmake -DCMAKE_BUILD_TYPE=Release -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/usr/share/ .
  cd CorsixTH
  make
}

package() {
  make -C CorsixTH-$pkgver/CorsixTH DESTDIR="$pkgdir/" install
  # launcher
  install -Dm0755 $pkgname.sh "$pkgdir"/usr/bin/CorsixTH
  # license
  install -Dm0644 CorsixTH-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  # .desktop integration
  install -Dm0644 $pkgname.desktop "$pkgdir"/usr/share/applications/CorsixTH.desktop
}
