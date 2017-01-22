# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=capers
pkgver=1.0
pkgrel=2
_commit=90cf1769b8ae935e304994f0f3155c218c42ce39
pkgdesc='Play checkers against the computer and study draughts games from books'
arch=('i686' 'x86_64')
url='http://arton.cunst.net/capers/index.html'
license=('GPL')
depends=('pygtk' 'gnome-python' 'gtk2')
source=("capers.tar.gz::https://github.com/hungerburg/capers/archive/$_commit.tar.gz"
        'capers.sh')
sha256sums=('1d5f5be3d9c38d3e36e56e7c6a20a529cf47f047c34b90863ba2f805fbd729a4'
            'e3b0d4f5662406868d3fd5d082f7727c693b4e8dd1b9f57c2192f5eb56ffe8f6')

prepare() {
  cd $pkgname-$_commit

  sed -i 's|python|python2|' Makefile
  sed -i 's|python|python2|' capers
}

build() {
  cd $pkgname-$_commit

  make DESTDIR=/opt/capers
}

package() {
  cd $pkgname-$_commit

  make DESTDIR="$pkgdir"/opt/capers install

  install -Dm755 ../capers.sh "$pkgdir"/usr/bin/capers
  install -Dm644 capers.desktop "$pkgdir"/usr/share/applications/capers.desktop
}
