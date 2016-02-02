#Maintainer: Michael Straube <m.s.online gmx.de>

pkgname=alterego-dreamwalker
# could not find any version number, so using 1.0
pkgver=1.0
pkgrel=1
pkgdesc="Alter Ego 2 - You control a hero who has a phantom twin, his alter ego."
url="http://www.retrosouls.net/?page_id=704"
arch=('any')
license=('custom:free')
depends=('mono' 'openal' 'sdl_mixer')
source=('http://www.retrosouls.net/desura/ae2fulllinux.zip'
        'alterego-dreamwalker.desktop'
        'aed.png')
md5sums=('14a9d9124252978dd163352b36bd0756'
         '2989ea7911bab17a97415b7518a810d0'
         '89d2ad5981016852a0b38430ec623455')

package() {
  cd "$srcdir/Full/AlterEgo_DreamWalker"

  mkdir -p "$pkgdir"/usr/{bin,share/games/alterego-dreamwalker}
  rm AlterEgo2.sh
  cp -r * "$pkgdir/usr/share/games/alterego-dreamwalker/"

  printf "%s\n%s\n" \
    '#!/bin/bash' \
    'cd /usr/share/games/alterego-dreamwalker' \
    'exec mono ./AlterEgo2.exe "$@"' \
    > "$pkgdir/usr/bin/alterego-dreamwalker"

  chmod 755 "$pkgdir/usr/bin/alterego-dreamwalker"

  install -Dm644 "$srcdir/alterego-dreamwalker.desktop" \
    "$pkgdir/usr/share/applications/alterego-dreamwalker.desktop"

  install -Dm644 "$srcdir/aed.png" \
    "$pkgdir/usr/share/pixmaps/alterego-dreamwalker.png"
}
