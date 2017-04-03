# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=barbie-seahorse-adventures
pkgver=1.1
pkgrel=5
pkgdesc="You're a seahorse - and you want to go to the moon!"
arch=('any')
url="http://www.imitationpickles.org/barbie"
license=('GPL2')
depends=('python2-pygame')
makedepends=('gendesk')
source=("http://www.imitationpickles.org/barbie/files/barbie-$pkgver.tgz"
        "barbie")
sha256sums=('915e261ae6b4321a38740c38ddf5f32b791b2c00b6f9f0cdd9fb87b0acf4f9f0'
            '1700719b3ce4faa27e8fd2833511797c899a6f1f81c1a80e207709ff2eb89ba9')

prepare() {
  cd barbie-$pkgver
  sed -i 's/python/python2/' run_game.py
  gendesk -f -n --pkgname=barbie --pkgdesc="$pkgdesc" --categories="Application;Game"
}

package() {
  cd barbie-$pkgver
  install -Dm755 run_game.py "$pkgdir"/usr/share/barbie/run_game.py
  install -m644 README.txt "$pkgdir"/usr/share/barbie
  cp -r lib data "$pkgdir"/usr/share/barbie
  rm "$pkgdir"/usr/share/barbie/data/*.txt
  install -Dm644 icon128.png "$pkgdir"/usr/share/pixmaps/barbie.png
  install -Dm644 barbie.desktop "$pkgdir"/usr/share/applications/barbie.desktop
  install -Dm755 ../barbie "$pkgdir"/usr/bin/barbie
}
