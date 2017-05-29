# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=guile-wm-git
pkgver=1.0.6.gf3c7b3b
pkgrel=1
pkgdesc="Windowmanagement environment for guile"
arch=('any')
url="http://www.markwitmer.com/guile-xcb/guile-wm.html"
license=('GPL')
depends=('guile' 'guile-xcb')
makedepends=('git')
provides=('guile-wm')
conflicts=('guile-wm')
source=("git+https://github.com/mwitmer/guile-wm.git")
md5sums=('SKIP')
options=('!makeflags')
_gitname="guile-wm"

pkgver() {
  cd $_gitname
  printf %s $(git describe --tags  | tr  - .)
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
