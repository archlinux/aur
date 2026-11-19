# Maintainer: Braulio Oliveira <brauliobo@gmail.com>
# Release package: builds the tag v$pkgver from GitHub.
pkgname=pg_sift
pkgver=5.0.2
pkgrel=1
pkgdesc='Fast analytics for PostgreSQL: just add an index, plus BM25 full-text search'
arch=('x86_64')
url='https://github.com/brauliobo/pg_sift'
license=('PostgreSQL')
depends=('postgresql>=18' 'postgresql<19' 'lz4' 'zstd')
install=pg_sift.install
makedepends=('git' 'make' 'gcc')
source=("pg_sift::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd pg_sift
  make SIFT_LTO=1
}

package() {
  cd pg_sift
  make SIFT_LTO=1 DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE NOTICE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md docs/*.md
}
