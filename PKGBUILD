# Maintainer: Braulio Oliveira <brauliobo@gmail.com>
pkgname=pg_rum-git
pkgver=1.3.15.r24.gc0e3bf3
pkgrel=1
pkgdesc='RUM access method for PostgreSQL - inverted index with additional information in posting lists (git version)'
arch=('x86_64')
url='https://github.com/postgrespro/rum'
license=('custom:PostgreSQL')
depends=('postgresql')
makedepends=('git' 'make' 'gcc' 'llvm' 'clang')
provides=("pg_rum=${pkgver%%.r*}")
conflicts=('pg_rum')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  make USE_PGXS=1
}

package() {
  cd "$pkgname"
  make USE_PGXS=1 DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
