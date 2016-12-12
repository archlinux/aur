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
sha256sums=('ff846b62737a280fcc38edd49820f977c8740e8aacbf5f054b6db5c3810c380a'
            'b451d57ebad7f04c59bc484a480c2590c217cf119b6428409e29cc3763b12b25'
            '4b32fa385bc4bbadabc7a1573ec52f6014f7f99ed942fd3aa9a2e0816a3da6dd')

prepare() {
  cd Full/AlterEgo_DreamWalker

  # convert line endings from DOS to Unix
  sed -i 's/\r$//' AlterEgo2.sh

  # patch launcher script
  sed -i '2i cd\ /usr/share/games/alterego-dreamwalker' AlterEgo2.sh
}

package() {
  cd Full/AlterEgo_DreamWalker

  install -Dm755 AlterEgo2.sh "$pkgdir"/usr/bin/alterego-dreamwalker
  rm AlterEgo2.sh

  install -dm755 "$pkgdir"/usr/share/games/alterego-dreamwalker
  cp -r * "$pkgdir"/usr/share/games/alterego-dreamwalker/

  install -Dm644 "$srcdir"/alterego-dreamwalker.desktop \
    "$pkgdir"/usr/share/applications/alterego-dreamwalker.desktop

  install -Dm644 "$srcdir"/aed.png \
    "$pkgdir"/usr/share/pixmaps/alterego-dreamwalker.png
}
