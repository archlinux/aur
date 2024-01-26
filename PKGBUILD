# Contributor: Jan-Erik Rediger <badboy@archlinux.us>

_gitname="dit"
pkgname=dit-git
pkgver=0.9.r8.g9a42f7d
pkgrel=1
pkgdesc="console text editor for Unix systems that you already know how to use"
arch=('i686' 'x86_64')
url="http://hisham.hm/dit"
license=('GPL')
depends=('lua53')
source=(git+https://github.com/hishamhm/dit)
sha1sums=('SKIP')


pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr --with-lua-suffix=5.3
  make
}

check() {
  cd "$srcdir/$_gitname"
  make check
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 sts=2 et:
