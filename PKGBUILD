_name=fibers
pkgname=guile-$_name-git
pkgver=v1.0.0.r25.gb86405a
pkgrel=1
pkgdesc="Concurrent ML-like concurrency for Guile"
arch=(any)
license=(LGPL3+)
makedepends=(git)
depends=("guile>=2.1.7")
provides=("guile-$_name")
source=(git://github.com/wingo/$_name.git)
url="https://github.com/wingo/fibers"
md5sums=(SKIP)
# shows warnings for .go files
options=(!strip)

pkgver() {
  cd "$srcdir/$_name" &&
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_name" &&
  autoreconf -vif &&
  ./configure --prefix=/usr &&
  make &&
  make install DESTDIR="$pkgdir"
}