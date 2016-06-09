# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=guile-wm-git
pkgver=r116.1e3114c
pkgrel=3
pkgdesc="Windowmanagement environment for guile"
arch=('any')
url="http://www.markwitmer.com/guile-xcb/guile-wm.html"
license=('GPL')
depends=('guile-xcb')
makedepends=('git')
provides=('guile-wm')
conflicts=('guile-wm')
source=("git+https://github.com/mwitmer/guile-wm")
md5sums=('SKIP')
options=('!makeflags')
_gitname="guile-wm"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir"/"$_gitname"
  autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
