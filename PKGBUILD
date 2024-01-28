# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>
# Contributor: Antonio Muñoz <agmconejo AT gmail DOT com>

pkgname=perl-ora2pg
pkgver=24.1
pkgrel=2
pkgdesc="Ora2Pg - Oracle to PostgreSQL database schema converter"
arch=('any')
url="http://ora2pg.darold.net"
license=('GPL-3.0-or-later')
depends=('perl' 'perl-dbd-oracle')
optdepends=('perl-dbd-pg: connect to a PostgreSQL db'
            'perl-dbd-mysql: connect to a MySQL db'
            'perl-term-readkey: read input from terminal')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/darold/ora2pg/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('65ef9799440d6d27b5b9e73c1ef1a459beb67a5287d4975b821fec3825401fd9')

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
