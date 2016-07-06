# Maintainer: Michael Straube <michael_straube web de>

pkgname=floodit
pkgver=0.1.1
pkgrel=3
pkgdesc="A flood it clone written in python"
arch=('any')
license=('unknown')
url="https://github.com/metulburr/FloodIt"
depends=('python2-pygame')
source=("https://github.com/metulburr/FloodIt/archive/$pkgver.tar.gz"
        "fix-savepath.patch"
        "floodit.desktop"
        "floodit")
sha1sums=('5c9e1355d84433544b8b792847a356563684cf0e'
          '19b7992f7b66d60f501d79c53b4cd41c318ecab9'
          '4c9aa6090901aba9719c10768e503958453f1819'
          '5a8140046c36b33456de6115ca23a7ff3e005356')

prepare() {
  cd FloodIt-$pkgver

  sed -i 's/python/python2/' game.py

  patch -p0 < "$srcdir/fix-savepath.patch"
}

package() {
  cd FloodIt-$pkgver

  install -dm755 "$pkgdir/usr/share/games/floodit"
  cp -r data resources game.py "$pkgdir/usr/share/games/floodit/"

  install -Dm755 "$srcdir/floodit" "$pkgdir/usr/bin/floodit"

  install -Dm644 "$srcdir/floodit.desktop" \
    "$pkgdir/usr/share/applications/floodit.desktop"
}
