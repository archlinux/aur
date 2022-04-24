# Maintainer: Fabian Brosda <fabi3141@gmx.de>
pkgname=gauche-dbd-pg
_gitver=24f3969
pkgver=0.2.1_${_gitver}
pkgrel=1
pkgdesc="Gauche Scheme Database Drivers for PostgreSQL"
arch=('i686' 'x86_64')
url="https://github.com/kahua/Gauche-dbd-pg"
license=('BSD')
depends=('gauche' 'postgresql-libs')
makedepends=('make' 'autoconf')
source=("https://github.com/kahua/Gauche-dbd-pg/tarball/${_gitver}")
sha256sums=('973abb6837193762a1a7bf7fd0997b05a9aa0ab3442df8a664050a6e2a024bfa')

_pkgname=kahua-${pkgname^}

build() {
  cd "$srcdir/$_pkgname-$_gitver"

  autoconf
  ./configure --prefix=/usr
  make PG_LDFLAGS="${LDFLAGS},-L`pg_config --libdir`" PG_CFLAGS="${CFLAGS} -I`pg_config --includedir`"
}

check() {
  cd "$srcdir/$_pkgname-$_gitver"

  make -k check
}

package() {
  cd "$srcdir/$_pkgname-$_gitver"

  make DESTDIR="$pkgdir/" prefix="$pkgdir/usr" install
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
