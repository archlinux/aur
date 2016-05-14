# Maintainer: Michael Straube <m.s.online gmx.de>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=barbie-seahorse-adventures
pkgver=1.1
pkgrel=2
pkgdesc="You're a seahorse - and you want to go to the moon!"
arch=('any')
url="http://www.imitationpickles.org/barbie/"
license=('GPL2')
depends=('python2-pygame')
source=("http://www.imitationpickles.org/barbie/files/barbie-$pkgver.tgz"
        "barbie.desktop")
sha256sums=('915e261ae6b4321a38740c38ddf5f32b791b2c00b6f9f0cdd9fb87b0acf4f9f0'
            '8cbd454193176c8752205395ff27789e16fffad5a65b5826602628443a3bade7')

prepare() {
  cd "barbie-$pkgver"

  sed -i 's/env\ python/python2/' run_game.py

  #create launcher script
  printf "#!/bin/bash\n/usr/share/games/barbie/run_game.py\n" > "$srcdir/barbie.sh"
}

package() {
  cd "barbie-$pkgver"

  install -dm755 "$pkgdir"/usr/{bin,share/games/barbie}

  cp -r run_game.py lib data "$pkgdir/usr/share/games/barbie/"
  chmod 755 "$pkgdir"/usr/share/games/barbie/{run_game.py,lib,data}
  rm "$pkgdir"/usr/share/games/barbie/data/*.txt

  install -Dm644 icon128.png "$pkgdir/usr/share/pixmaps/barbie.png"
  install -Dm644 "$srcdir/barbie.desktop" "$pkgdir/usr/share/applications/barbie.desktop"

  install -m755 "$srcdir/barbie.sh" "$pkgdir/usr/bin/barbie"
}
