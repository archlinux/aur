# Maintainer: Braulio Oliveira <brauliobo@gmail.com>
# Release package: builds the tag v$pkgver from GitHub.
# To package the committed HEAD of this checkout instead, run: cd packaging && makepkg -p PKGBUILD.local -f
pkgname=pg_sift
pkgver=4.0.1
pkgrel=1
pkgdesc='Fast analytics for PostgreSQL: keep your queries, just add an index. Plus BM25 full-text search'
arch=('x86_64')
url='https://github.com/brauliobo/pg_sift'
license=('PostgreSQL')
depends=('postgresql>=18' 'postgresql<19' 'lz4' 'zstd')
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
