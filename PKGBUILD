# Maintainer: Fabian Brosda <fabi3141@gmx.de>
pkgname=gauche-dbd-pg
_pkgname=${pkgname^}
pkgver=0.3
pkgrel=1
pkgdesc="Gauche Scheme Database Drivers for PostgreSQL"
arch=('i686' 'x86_64')
url="https://github.com/kahua/Gauche-dbd-pg"
license=('BSD')
depends=('gauche' 'postgresql-libs')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kahua/Gauche-dbd-pg/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d2d691e2c8b717e161d53964585fda59554cda8d9abf22b27be487c887459fe3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr
  make PG_LDFLAGS="${LDFLAGS},-L`pg_config --libdir`" PG_CFLAGS="${CFLAGS} -I`pg_config --includedir`"
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"

  make -k check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" prefix="$pkgdir/usr" install
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
