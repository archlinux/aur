# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=guile-wm-git
pkgver=20170507.be8b6d1
pkgrel=1
pkgdesc="Windowmanagement environment for guile"
arch=('any')
url="http://www.markwitmer.com/guile-xcb/guile-wm.html"
license=('GPL')
depends=('guile' 'guile-xcb')
makedepends=('git')
provides=('guile-wm')
conflicts=('guile-wm')
source=("git+https://github.com/mwitmer/guile-wm")
md5sums=('SKIP')
options=('!makeflags')
_gitname="guile-wm"

pkgver() {
  git log -1 --format='%cd.%h' --date=short | tr -d -
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
