# Maintainer: Michael Straube <m.s.online gmx.de>

pkgname=sdlpop
pkgver=1.16
pkgrel=1
pkgdesc="An open-source port of Prince of Persia"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/NagyD/SDLPoP"
depends=('sdl2' 'sdl2_image' 'sdl2_mixer')
source=("https://github.com/NagyD/SDLPoP/archive/v$pkgver.tar.gz")
sha1sums=('9e6f124705ef3c6e9c66c34046c9d4d5deaffa57')

prepare() {
  printf '#!/bin/bash\ncd /usr/share/sdlpop\n./prince "$@"\n' > prince
}

build() {
  cd SDLPoP-$pkgver
  make
}

package() {
  cd SDLPoP-$pkgver

  install -d -m 755 "$pkgdir"/usr/share/{sdlpop,doc/sdlpop}

  cp -r data prince SDLPoP.ini *.DAT "$pkgdir/usr/share/sdlpop/"
  cp doc/* "$pkgdir/usr/share/doc/sdlpop/"

  install -D -m 755 "$srcdir/prince" "$pkgdir/usr/bin/prince"
}
