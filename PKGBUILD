# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mickey-scheme-git
pkgver=490.a926275
pkgrel=1
pkgdesc="Incomplete, slow and buggy implementation of R7RS-small Scheme"
arch=('i686' 'x86_64')
url="https://github.com/cslarsen/mickey-scheme"
license=('GPL')
depends=('libffi' 'readline')
makedepends=('git')
source=("git+https://github.com/cslarsen/mickey-scheme.git")
md5sums=('SKIP')
_gitname="mickey-scheme"

pkgver() {
  cd "$srcdir"/"$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make -j
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
