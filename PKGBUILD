# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=guile-xcb-git
pkgver=r88.db7d5a3
pkgrel=1
pkgdesc="Windowmanagement environment for guile"
arch=('x86_64' 'i686')
url="http://www.markwitmer.com/guile-xcb/guile-wm.html"
license=('GPL')
makedepends=('git')
provides=('guile-xcb')
conflicts=('guile-xcb')
source=("git+https://github.com/mwitmer/guile-xcb")
md5sums=('SKIP')
_gitname="guile-xcb"
options=('!makeflags')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd "$_gitname"
  sed -i 's+2.0 2.2+2.2+' configure.ac
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
