# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=postgresql-semver
pkgver=0.32.0
pkgrel=1
pkgdesc='Semantic version data-type for PostgreSQL'
arch=('x86_64')
url='https://github.com/theory/pg-semver'
license=('custom:PostgreSQL')
depends=('postgresql')
makedepends=('git' 'postgresql-libs' 'clang' 'llvm')
_commit='9c071c068480a55af897cd6e0c5dd80ffcdb84ab'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
	make -C "$pkgname"
}

package() {
  cd "$pkgname"

	make DESTDIR="$pkgdir" install

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" Changes README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
