# Maintainer: kiasoc5 <kiasoc5 at disroot dot org>

pkgname=guile-fibers
pkgver=1.1.0
pkgrel=1
pkgdesc="Concurrent ML-like concurrency for Guile"
arch=(any)
license=(LGPL3+)
makedepends=(git)
depends=("guile>=2.1.7")
provides=("guile-fibers")
source=(https://github.com/wingo/fibers/releases/download/v${pkgver}/fibers-${pkgver}.tar.gz)
url="https://github.com/wingo/fibers"
md5sums=('6770adca5d257abd1e7b78fef4177b80')
# shows warnings for .go files
options=(!strip)

build() {
  cd "$srcdir/fibers-${pkgver}"
  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/fibers-${pkgver}"
  make install DESTDIR="$pkgdir"
}

check() {
  cd "$srcdir/fibers-${pkgver}"
  make check
}
