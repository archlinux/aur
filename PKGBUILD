# maintainer: luka null <lukadevnull@vivaldi.net>
pkgname=pg_clickhouse
pkgver=0.10.0
pkgrel=1
pkgdesc='PostgreSQL extension to query ClickHouse databases from PostgreSQL'
arch=('x86_64')
url='https://github.com/ClickHouse/pg_clickhouse'
license=('Apache-2.0')
depends=('postgresql' 'curl' 'util-linux-libs')
makedepends=('git' 'make' 'cmake' 'gcc' 'openssl')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname"
  make WCLOBBERED=-Wno-error=clobbered
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
