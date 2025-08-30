# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>

pkgname=repmgr15
pkgver=5.5.0
pkgrel=1
pkgdesc="repmgr is an open-source tool suite for managing replication and failover in a cluster of PostgreSQL 15 servers."
arch=('any')
url="https://repmgr.org/"
license=('GPL')
install=$pkgname.install
depends=('postgresql15-libs')
makedepends=('autoconf' 'postgresql15' 'clang' 'llvm')
source=(https://github.com/EnterpriseDB/repmgr/releases/download/v$pkgver/repmgr-$pkgver.tar.gz)
sha1sums=('c5633c351f3a0627a53ac1828ac7581ee74c7e0c')

build() {
	export PG_CONFIG=/opt/postgresql15/bin/pg_config
	cd "repmgr-$pkgver"
	./configure
	make
}

package() {
	cd "repmgr-$pkgver"
	make DESTDIR="$pkgdir/" install
}

