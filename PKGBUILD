# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=dit-git
pkgver=v0.1.r142.g94b4867
pkgrel=1
pkgdesc="A console text editor for Unix systems that you already know how to use"
arch=('i686' 'x86_64')
url="http://hisham.hm/dit"
license=('GPL')
depends=('lua52')
source=(git+https://github.com/hishamhm/dit)
sha1sums=('SKIP')

_gitname="dit"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr --with-lua-suffix=5.2
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
