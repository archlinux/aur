# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=postgresql-semver
_pkgname=pg-semver
pkgver=0.31.1
pkgrel=1
pkgdesc="Semantic version data type for PostgreSQL"
arch=('x86_64')
url="https://github.com/theory/pg-semver"
license=('custom:PostgreSQL')
depends=('postgresql')
makedepends=('postgresql-libs' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('dbe40846d6e643c1aa24514e51645170baf43547b906a0bfe2c9db16f706a339f0b30f5a91ebb4d242030ce84ee5024d4e785e47c99636085e0dedf0861ac1d3')

build() {
	make -C "$_pkgname-$pkgver"
}

package() {
  cd "$_pkgname-$pkgver"

	make DESTDIR="$pkgdir" install

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" Changes README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
