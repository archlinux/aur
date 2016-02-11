# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=ucg-git
_gitname=ucg
pkgver=0.2.1.r0.g5241710
pkgrel=1
pkgdesc="fast grep-like tool specialized for searching large bodies of source code"
arch=(i686 x86_64)
url="https://github.com/gvansickle/ucg"
license=(GPL)
depends=("pcre>=8.2")
makedepends=(git)
provides=(ucg)
conflicts=(ucg)
source=(git+https://github.com/gvansickle/ucg)
sha1sums=(SKIP)

pkgver() {
    cd "$_gitname"
    git describe --long --tags \
        | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}
