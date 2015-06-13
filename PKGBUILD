# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=multimon-ng-git
pkgver=20140331
pkgrel=1
pkgdesc="An sdr decoder, supports pocsag, ufsk, clipfsk, afsk, hapn, fsk, dtmf, zvei."
url="http://dekar.wc3edit.net/2012/05/24/multimonng/"
arch=('i686' 'x86_64')
license=("GPL2")
depends=('ncurses' 'libpulse')
makedepends=('git' 'qt4')
optdepends=('sox: wav conversion')

source=("git://github.com/EliasOenal/multimonNG.git")
md5sums=('SKIP')
_gitname="multimonNG"

pkgver() {
    cd "$srcdir/$_gitname"
    git show -s --format="%ci" HEAD | cut -d ' ' -f 1 | tr -d '-'
}

build() {
  cd "$srcdir/$_gitname"

  qmake-qt4 PREFIX=/usr multimon-ng.pro
  sed -i 's/-lpulse-simple/& -lpulse/' Makefile
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_gitname"
  #make DESTDIR=$pkgdir install
  install -Dm755 multimon-ng "$pkgdir/usr/bin/multimon-ng"
}
