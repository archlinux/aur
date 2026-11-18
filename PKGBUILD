# Maintainer: Braulio Oliveira <brauliobo@gmail.com>
pkgname=pgx-bm25
pkgver=1.0.1
pkgrel=1
pkgdesc='Native BM25 ranked full-text index access method for PostgreSQL (bm25_native)'
arch=('x86_64')
url='https://github.com/pgexperts/pgx-bm25'
license=('PostgreSQL')
depends=('postgresql')
makedepends=('make' 'gcc' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5def26398e065d08da14c37c79c0cfc91c158a389bd3027e13dea46e125293c7')

build() {
  cd "$pkgname-$pkgver"
  nice make -j4 USE_PGXS=1
}

package() {
  cd "$pkgname-$pkgver"
  make USE_PGXS=1 DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
