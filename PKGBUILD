# Maintainer: Carsten Feuls <archlinux dot carstenfeuls dot de>

pkgname=check_postgres
pkgver=2.25.0
pkgrel=1
pkgdesc="Nagios check_postgres plugin for checking status of PostgreSQL databases"
arch=('any')
url="http://bucardo.org/wiki/Check_postgres"
license=('custom')
depends=('perl' 'perl-dbd-pg')
optdepends=('postgresql')
source=(https://github.com/bucardo/check_postgres/archive/${pkgver}.tar.gz)
sha512sums=('ab7d4b231f1428f549a2da0370de63c39d54287f8284c65044d1aa8fed120d89e9730c3b614004fdc298536402330ccac43d2d9dfe8b20cc5aff6f89f7be0915')


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
	chmod o+rx "${pkgdir}/usr/lib/monitoring-plugins/check_postgres"
	cd "${pkgdir}/usr/lib/monitoring-plugins"
	./check_postgres --symlinks
}

