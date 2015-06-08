# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=mustache-c-git
pkgver=17.c00262c
pkgrel=2
pkgdesc="Mustache templates implementation in pure c"
url="https://github.com/x86-64/mustache-c"
arch=('i686' 'x86_64')
license=( 'LGPL3' )
makedepends=( 'git' )
depends=( 'glibc' )
provides=( 'mustache-c' )
conflicts=( 'mustache-c' )
source=( "git+https://github.com/x86-64/mustache-c" )
sha1sums=( 'SKIP' )

_gitname=mustache-c

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR=$pkgdir install
}
