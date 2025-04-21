# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>
# Contributor: Antonio Muñoz <agmconejo AT gmail DOT com>

pkgname=ora2pg
pkgver=25.0
pkgrel=1
pkgdesc="Oracle to PostgreSQL database schema converter"
arch=('any')
url="http://ora2pg.darold.net"
license=('GPL-3.0-or-later')
depends=('perl' 'perl-dbd-oracle')
optdepends=('perl-dbd-pg: connect to a PostgreSQL db'
            'perl-dbd-mysql: connect to a MySQL db'
            'perl-term-readkey: read input from terminal')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/darold/ora2pg/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4f437f8240e5f0b46baf234d86bcf731be30fd6ae2b39ea2c2a8942a25c72a6e')

build() {
	cd "ora2pg-${pkgver}"
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL DESTDIR=${pkgdir} INSTALLDIRS=vendor
	make
}

package() {
	cd "ora2pg-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	cp ${pkgdir}/etc/ora2pg/ora2pg.conf{.dist,}
	sed -i "s#${pkgdir}##" ${pkgdir}/usr/bin/vendor_perl/ora2pg
}
