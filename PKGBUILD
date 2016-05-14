# Maintainer: Michael Straube <m.s.online gmx.de>

pkgname=floodit
pkgver=0.1.1
pkgrel=1
pkgdesc='A flood it clone written in python'
arch=('any')
license=('unknown')
url='https://github.com/metulburr/FloodIt'
depends=('python2-pygame')
source=("https://github.com/metulburr/FloodIt/archive/$pkgver.tar.gz"
        "fix-savepath.patch"
        "floodit.desktop")
md5sums=('844d6f87d207c855a11238325f7c9ee2'
         '0be51f3fd9ff3f667f46d7bd6a649802'
         'b310a9d674c95357dadc10ee290a4dd0')

prepare() {
  cd FloodIt-$pkgver

  sed -i 's/python/python2/' game.py
  patch -p0 < "$srcdir/fix-savepath.patch"

  # create launcher script
  printf "#!/bin/bash\ncd /usr/share/games/floodit\n./game.py" \
    > "$srcdir/floodit.sh"
}

package() {
  cd FloodIt-$pkgver

  install -dm755 "$pkgdir/usr/share/games/floodit"
  cp -r data resources game.py "$pkgdir/usr/share/games/floodit/"

  install -Dm755 "$srcdir/floodit.sh" "$pkgdir/usr/bin/floodit"

  install -Dm644 "$srcdir/floodit.desktop" \
    "$pkgdir/usr/share/applications/floodit.desktop"
}
