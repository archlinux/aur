# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=pg_auto_failover-old-upgrade
_pkgname="${pkgname%-old-upgrade}"
pkgver=2.2
pkgrel=1
_pg_majorver=16
pkgdesc="pg_auto_failover build against postgresql-old-upgrade package for pg_upgrade"
arch=('x86_64')
url="https://github.com/citusdata/pg_auto_failover"
license=('PostgreSQL')
depends=('postgresql-old-upgrade' 'ncurses')
makedepends=('clang' 'llvm')
options=('!buildflags')
source=("$pkgname-$pkgver.tar.gz::https://github.com/citusdata/pg_auto_failover/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0f4018564e620592fcfb43d52ea2bc3ccba33bd824352fa9c7e55eb2ba0a4f6c')

build() {
	cd "$_pkgname-$pkgver"

	export PG_CONFIG="/opt/pgsql-${_pg_majorver}/bin/pg_config"

	make
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
