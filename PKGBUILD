# Maintainer: Michael Straube <michael_straube web de>

pkgname=alterego-dreamwalker
# could not find any version number, so using 1.0
pkgver=1.0
pkgrel=2
pkgdesc="Alter Ego 2 - You control a hero who has a phantom twin, his alter ego"
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

prepare() {
  cd Full/AlterEgo_DreamWalker

  # convert line endings from DOS to Unix
  sed -i 's/\r$//' AlterEgo2.sh

  # patch launcher script
  sed -i '2i cd\ /usr/share/games/alterego-dreamwalker' AlterEgo2.sh
}

package() {
  cd Full/AlterEgo_DreamWalker

  install -Dm755 AlterEgo2.sh "$pkgdir/usr/bin/alterego-dreamwalker"
  rm AlterEgo2.sh

  install -dm755 "$pkgdir/usr/share/games/alterego-dreamwalker"
  cp -r * "$pkgdir/usr/share/games/alterego-dreamwalker/"

  install -Dm644 "$srcdir/alterego-dreamwalker.desktop" \
    "$pkgdir/usr/share/applications/alterego-dreamwalker.desktop"

  install -Dm644 "$srcdir/aed.png" \
    "$pkgdir/usr/share/pixmaps/alterego-dreamwalker.png"
}
