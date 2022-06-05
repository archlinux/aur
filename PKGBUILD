# Maintainer: kiasoc5 <kiasoc5 at disroot dot org>

_name=fibers
pkgname=guile-$_name
pkgver=1.1.1
pkgrel=1
_commit=cf3729a4b6f9d46cb0123b208b767efcd19539b3
pkgdesc="Concurrent ML-like concurrency for Guile"
arch=(any)
license=(LGPL3+)
makedepends=(git)
depends=("guile>=2.1.7")
source=(git+https://github.com/wingo/${_name}.git#commit=${_commit})
url="https://github.com/wingo/fibers"
md5sums=('SKIP')
# shows warnings for .go files
options=(!strip)

build() {
  cd "$srcdir/$_name"
  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_name"
  make install DESTDIR="$pkgdir"
}

check() {
  cd "$srcdir/$_name"
  make check
}
