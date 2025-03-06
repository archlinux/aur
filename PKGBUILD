# Maintainer: Eragon <eragon at eragon dot re>
# Maintainer: ltdk <usr@ltdk.xyz>
_pkgbase=pg_uuidv7
pkgname=$_pkgbase-old-upgrade
pkgver=1.6.0
pkgrel=3
pgver=16
pkgdesc="Version of pg_uuidv7 extension compiled for use with postgresql-old-upgrade"
arch=(x86_64 aarch64)
url="https://github.com/fboulnois/pg_uuidv7"
license=('MPL2')
depends=("postgresql-old-upgrade")
makedepends=("clang")
source=("https://github.com/fboulnois/pg_uuidv7/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0fa6c710929d003f6ce276a7de7a864e9d1667b2d78be3dc2c07f2409eb55867')

build() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	make PG_CONFIG=/opt/pgsql-$pgver/bin/pg_config
}

package() {
	cd "${srcdir}/${_pkgbase}-${pkgver}/"

	make PG_CONFIG=/opt/pgsql-$pgver/bin/pg_config DESTDIR="${pkgdir}/" install
}
