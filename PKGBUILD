# Maintainer: Martin Harrigan <martinharrigan at gmail dot com>
# Contributor: Eragon <eragon at eragon dot re>
# Contributor: ltdk <usr@ltdk.xyz>
_pkgbase='pg_uuidv7'
pkgname="$_pkgbase-old-upgrade"
pkgdesc='Version of pg_uuidv7 extension compiled for use with postgresql-old-upgrade'
url='https://github.com/fboulnois/pg_uuidv7'
pkgver=1.7.0
pkgrel=1
pgver=17
arch=(x86_64 aarch64)
license=('MPL2')
depends=('postgresql-old-upgrade')
makedepends=('clang')
source=("https://github.com/fboulnois/pg_uuidv7/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ef1b332980ff1dfcf1962bf9b9e688254abf72f909de03cabed00a385c75148d')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make PG_CONFIG=/opt/pgsql-$pgver/bin/pg_config
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}/"
    make PG_CONFIG=/opt/pgsql-$pgver/bin/pg_config DESTDIR="${pkgdir}/" install
}
