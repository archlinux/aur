# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: Marti Raudsepp <marti at juffo dot org>
pkgname=pg_repack
pkgver=1.4.7
pkgrel=1
pkgdesc="Reorganize tables in PostgreSQL databases with minimal locks (fork of pg_reorg)"
arch=(i686 x86_64)
url="https://reorg.github.io/pg_repack/"
license=('BSD')
depends=('postgresql-libs')
makedepends=('postgresql')
source=("https://github.com/reorg/pg_repack/archive/ver_${pkgver}.tar.gz")
sha256sums=('bff8715073dd43b0e6a86d1e97a83cd0729191d9bf6223df42153c2400431397')

prepare() {
  cd "$srcdir/$pkgname-ver_$pkgver"
}

build() {
  cd "$srcdir/$pkgname-ver_$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-ver_$pkgver"
  install -Dm755 bin/pg_repack "$pkgdir"/usr/bin/pg_repack
  install -Dm755 lib/pg_repack.so "$pkgdir"/usr/lib/postgresql/pg_repack.so
  install -Dm644 lib/pg_repack--${pkgver}.sql "$pkgdir"/usr/share/postgresql/extension/pg_repack--${pkgver}.sql
  install -Dm644 lib/pg_repack.control "$pkgdir"/usr/share/postgresql/extension/pg_repack.control
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/pg_repack/COPYRIGHT
}

# vim: ts=2 sw=2 et:
