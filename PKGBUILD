# Maintainer: Michael Straube <michael_straube web de>

pkgname=alterego
# could not find any version number, so using 1.0
pkgver=1.0
pkgrel=2
pkgdesc="You control a hero who has a phantom twin, his alter ego"
url="http://www.retrosouls.net/?page_id=614"
arch=('any')
license=('custom:free')
depends=('mono' 'sdl_mixer')
source=('http://www.retrosouls.net/files/AlterEgo_Linux.tar.gz'
        'alterego.desktop'
        'ae1-150x150.png')
md5sums=('d018fbfdc0b15b8ac090e918c14b58aa'
         '46d530b31311a689932dd2a9025dd2a3'
         'f3ed74ec7da62c8f88f81a7c2012d040')

prepare() {
  cd AlterEgo_Linux/AlterEgo

  # convert line endings from DOS to Unix
  sed -i 's/\r$//' AlterEgo.sh

  # patch launcher script
  sed -i '2i cd\ /usr/share/games/alterego' AlterEgo.sh
}

package() {
  cd AlterEgo_Linux/AlterEgo

  install -Dm755 AlterEgo.sh "$pkgdir/usr/bin/alterego"
  rm AlterEgo.sh

  install -dm755 "$pkgdir/usr/share/games/alterego"
  cp -r * "$pkgdir/usr/share/games/alterego/"

  # game does not run without world writable bit set :-/
  find "$pkgdir/usr/share" -type f -exec chmod 666 {} \;

  install -Dm644 "$srcdir/alterego.desktop" \
    "$pkgdir/usr/share/applications/alterego.desktop"

  install -Dm644 "$srcdir/ae1-150x150.png" \
    "$pkgdir/usr/share/pixmaps/alterego.png"
}
