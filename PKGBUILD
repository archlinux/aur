# Maintainer: Michael Straube <michael_straube@web.de>

pkgname=capers
pkgver=1.0
pkgrel=1
pkgdesc='Play checkers against the computer and study draughts games from books'
arch=('i686' 'x86_64')
url='http://arton.cunst.net/capers/index.html'
license=('GPL')
depends=('pygtk' 'gnome-python')
makedepends=('git')
source=('git+https://github.com/hungerburg/capers.git#commit=90cf176'
        'capers.sh')
sha1sums=('SKIP'
          '19e198944d3bc825102722483be6664ebfbf414e')

prepare() {
  cd $pkgname

  sed -i 's|python|python2|' Makefile
  sed -i 's|python|python2|' capers
}

build() {
  cd $pkgname

  make DESTDIR=/opt/capers
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir"/opt/capers install

  install -Dm755 ../capers.sh "$pkgdir"/usr/bin/capers
  install -Dm644 capers.desktop "$pkgdir"/usr/share/applications/capers.desktop
}
