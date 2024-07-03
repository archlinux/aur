# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=multimon-ng-git
pkgver=20240628
pkgrel=1
pkgdesc="An sdr decoder, supports pocsag, ufsk, clipfsk, afsk, hapn, fsk, dtmf, zvei."
url="http://dekar.wc3edit.net/2012/05/24/multimonng/"
arch=('i686' 'x86_64')
license=("GPL-2.0-or-later")
depends=('glibc' 'libpulse' 'libx11')
makedepends=('git' 'qt5-base')
optdepends=('sox: wav conversion')
provides=('multimon-ng')
conflicts=('multimon-ng')
source=("git+https://github.com/EliasOenal/multimonNG.git")
md5sums=('SKIP')
_gitname="multimonNG"

pkgver() {
    cd "$srcdir/$_gitname"
    git show -s --format="%ci" HEAD | cut -d ' ' -f 1 | tr -d '-'
}

build() {
  cd "$srcdir/$_gitname"

  qmake PREFIX=/usr multimon-ng.pro
  sed -i 's/-lpulse-simple/& -lpulse/' Makefile
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_gitname"
  #make DESTDIR=$pkgdir install
  install -Dm755 multimon-ng "$pkgdir/usr/bin/multimon-ng"
}
