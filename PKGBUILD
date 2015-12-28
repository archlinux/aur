# Maintainer: %s <%s>
pkgname=guile-xcb-git
pkgver=r85.ec4712e
pkgrel=1
pkgdesc="Windowmanagement environment for guile"
arch=('any')
url="http://www.markwitmer.com/guile-xcb/guile-wm.html"
license=('GPL')
makedepends=('git')
provides=('guile-xcb')
conflicts=('guile-xcb')
install=$pkgname.install
source=("git+https://github.com/mwitmer/guile-xcb")
md5sums=('SKIP')
_gitname="guile-xcb"
options=('!makeflags')

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
