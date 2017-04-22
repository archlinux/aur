# Maintainer: Carsten Feuls <archlinux dot carstenfeuls dot de>

pkgname=check_postgres
pkgver=2.22.0
pkgrel=1
pkgdesc="Nagios check_postgres plugin for checking status of PostgreSQL databases"
arch=('any')
url="http://bucardo.org/wiki/Check_postgres"
license=('custom')
depends=('perl' 'perl-dbd-pg')
optdepends=('postgresql')
source=(https://github.com/bucardo/check_postgres/archive/${pkgver}.tar.gz)
sha512sums=('d49b11df2c64c052ba67adabdcd12d0fff1a9aacd443efa8a884104678e84abf62fa89cfe0546fcd37313abdddb28d3123c556b1ceecd90f8dd50e16dec3c62c')


build() {
	cd ${pkgname}-${pkgver}
	perl Makefile.PL
	make
}

package() {
	cd ${pkgname}-${pkgver}
	mkdir -p "${pkgdir}/usr/lib/monitoring-plugins"
	make install DESTDIR=${pkgdir}
	cp check_postgres.pl "${pkgdir}/usr/lib/monitoring-plugins/check_postgres"
	cd "${pkgdir}/usr/lib/monitoring-plugins"
	./check_postgres --symlinks
}

