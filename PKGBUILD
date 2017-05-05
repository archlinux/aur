# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=guile-wm-git
pkgver=r6.00ae1e3
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
