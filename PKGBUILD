# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=mysql_fdw
pkgver=2.9.2
pkgrel=1
pkgdesc="PostgreSQL foreign data wrapper for MySQL"
arch=('x86_64')
url="https://github.com/EnterpriseDB/mysql_fdw"
license=('PostgreSQL')
depends=(postgresql)
makedepends=(gcc llvm mariadb-libs postgresql-libs)
checkdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EnterpriseDB/mysql_fdw/archive/refs/tags/REL-${pkgver//./_}.tar.gz")
sha256sums=('dae56fc82801d68d97e7cecf48dfade9c6ba7cadc3439227c2cf28bcb142e820')

build() {
    cd "${pkgname}-REL-${pkgver//./_}"
    make USE_PGXS=1
}

package() {
    cd "${pkgname}-REL-${pkgver//./_}"
    make USE_PGXS=1 DESTDIR="${pkgdir}" install
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
