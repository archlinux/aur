# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=sdlpop
pkgver=1.16
pkgrel=6
pkgdesc="An open-source port of Prince of Persia"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/NagyD/SDLPoP"
depends=('sdl2_image' 'sdl2_mixer')
source=("https://github.com/NagyD/SDLPoP/archive/v$pkgver.tar.gz"
        "https://github.com/NagyD/SDLPoP/raw/master/data/icon.png"
        "sdlpop.desktop"
        "prince")
sha256sums=('4198eecdb2c4fed8f609af810962c943572df83da99c571146cee1596e7ee55b'
            '180bf87d528da7840183d7c7647c361066f687ce49051233923acdbfc1d50c70'
            '17a7bda2a51c6e6380c81f215387821280c4259fa5a24947de87c2926edad022'
            '4673b27ab68c2fa8babf7a5b5fa3bd42012a05e5e8e190fe29d93873445beb18')

build() {
  cd SDLPoP-$pkgver

  make
}

package() {
  cd SDLPoP-$pkgver

  install -d "$pkgdir"/usr/{lib/sdlpop,share/sdlpop}

  install -m 755 prince "$pkgdir"/usr/lib/sdlpop
  install -m 644 SDLPoP.ini *.DAT "$pkgdir"/usr/share/sdlpop
  cp -r data doc "$pkgdir"/usr/share/sdlpop

  install -D -m 755 ../prince "$pkgdir"/usr/bin/prince

  install -D -m 644 ../icon.png "$pkgdir"/usr/share/pixmaps/sdlpop.png
  install -D -m 644 ../sdlpop.desktop "$pkgdir"/usr/share/applications/sdlpop.desktop
}
