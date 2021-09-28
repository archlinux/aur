# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=postgresql-semver
_pkgname=pg-semver
pkgver=0.31.2
pkgrel=1
pkgdesc="Semantic version data type for PostgreSQL"
arch=('x86_64')
url="https://github.com/theory/pg-semver"
license=('custom:PostgreSQL')
depends=('postgresql')
makedepends=('postgresql-libs' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('ac1fcd66d62fa369fbeee04b490987737bb781dcf93e8c0b397ccefc336fe99e13fd281d85e3a33629084958d3e7936c3b7a8a32f5bb8c28304f7fe22092b51d')

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
