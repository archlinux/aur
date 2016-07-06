# Maintainer: Michael Straube <michael_straube web de>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=barbie-seahorse-adventures
pkgver=1.1
pkgrel=3
pkgdesc="You're a seahorse - and you want to go to the moon!"
arch=('any')
url="http://www.imitationpickles.org/barbie"
license=('GPL2')
depends=('python2-pygame')
source=("http://www.imitationpickles.org/barbie/files/barbie-$pkgver.tgz"
        "barbie.desktop"
        "barbie")
sha1sums=('49decb0e0abd3d0b99d17f491c9026ed39334db1'
          '98454e0347954ed95e87bc08f6d4c9e35924666e'
          '9e91787f0710367aeec42799c3139fb15234729f')

prepare() {
  cd barbie-$pkgver

  sed -i 's/env\ python/python2/' run_game.py
}

package() {
  cd barbie-$pkgver

  install -dm755 "$pkgdir/usr/share/games/barbie"

  install -m755 run_game.py "$pkgdir/usr/share/games/barbie/"
  install -m644 README.txt "$pkgdir/usr/share/games/barbie/"
  cp -r lib data "$pkgdir/usr/share/games/barbie/"
  rm "$pkgdir"/usr/share/games/barbie/data/*.txt

  install -Dm644 icon128.png "$pkgdir/usr/share/pixmaps/barbie.png"
  install -Dm644 "$srcdir/barbie.desktop" "$pkgdir/usr/share/applications/barbie.desktop"

  install -Dm755 "$srcdir/barbie" "$pkgdir/usr/bin/barbie"
}
