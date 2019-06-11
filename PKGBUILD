# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributors: jdc, rayman2200, TheCycoONE

pkgname=corsix-th
pkgver=0.63
pkgrel=1
pkgdesc='Reimplementation of the game engine of Theme Hospital'
url='https://github.com/CorsixTH/CorsixTH'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('cmake')
depends=('lua' 'lua-lpeg' 'lua-filesystem' 'sdl2_mixer' 'ffmpeg')
optdepends=('freepats-legacy: Soundfont for Midi playback'
            'soundfont-fluid: Alternative soundfont for Midi playback')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/CorsixTH/CorsixTH/archive/v$pkgver.tar.gz")
sha256sums=('9016ce0a22e0e800937970a91b48aaf536fc901c98d3edd1e11bf97590523d81')

build() {
  cd CorsixTH-$pkgver

  cmake -DCMAKE_BUILD_TYPE=Release -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/usr .
  cd CorsixTH
  make
}

package() {
  make -C CorsixTH-$pkgver/CorsixTH DESTDIR="$pkgdir/" install
  # executable name changed with 0.62
  ln -s $pkgname "$pkgdir"/usr/bin/CorsixTH
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/share/corsix-th/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/
}
