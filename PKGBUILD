# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Maintainer: SanskritFritz (gmail)

pkgname=solarwolf-widescreen
pkgver=1.5
pkgrel=4
arch=('any')
pkgdesc="Scramble through 60 levels collecting space boxes while dodging obstacles. Widescreen fork."
url="http://posor.hostingkunde.de/solarwolf/solarwolf.htm"
depends=('python2-pygame')
provides=('solarwolf')
conflicts=('solarwolf')
license=('LGPL')
source=("http://posor.hostingkunde.de/solarwolf/solarwolf_we.tar.bz2"
        solarwolf-wide.desktop)
md5sums=('41858897fbe0ad39c9152ec6c10d503c'
         '8c5a88274360238cb970bc451c6873df')

build() {
  cd "$srcdir/solarwolf"
  sed -i 's|/usr/share/games/solarwolf|/usr/share/solarwolf|g' solarwolf.py
  sed -i 's|/usr/lib/games/solarwolf|/usr/lib/solarwolf|g' solarwolf.py

  sed -i "s/python/python2/" solarwolf.py
}

package() {
  cd "$srcdir/solarwolf"
  install -Dm755 solarwolf.py "$pkgdir/usr/bin/solarwolf"

  install -dm755 "$pkgdir"/usr/{lib/solarwolf,share/solarwolf/data/{audio,music}}
  install -m644 data/*.{png,gif,txt,pal} "$pkgdir/usr/share/solarwolf/data"
  install -m644 data/audio/* "$pkgdir/usr/share/solarwolf/data/audio"
  install -m644 data/music/* "$pkgdir/usr/share/solarwolf/data/music"
  install -m644 code/* "$pkgdir/usr/lib/solarwolf"

#  install -Dm644 dist/solarwolf.png $pkgdir/usr/share/pixmaps/solarwolf.png
  install -Dm644 "$srcdir/solarwolf-wide.desktop" "$pkgdir/usr/share/applications/solarwolf.desktop"
}

