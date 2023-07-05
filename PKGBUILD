# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>
# Contributor: Antonio Muñoz <agmconejo AT gmail DOT com>

pkgname=perl-ora2pg
pkgver=24.0
pkgrel=1
pkgdesc="Ora2Pg - Oracle to PostgreSQL database schema converter"
arch=('any')
url="http://ora2pg.darold.net"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-dbd-oracle')
optdepends=('perl-dbd-pg: connect to a PostgreSQL db'
            'perl-dbd-mysql: connect to a MySQL db'
            'perl-term-readkey: read input from terminal')
options=('!emptydirs')
source=("https://github.com/darold/ora2pg/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dfb8eac7abea049ca5651e37e8633afc30011dea0e1d3208e1a030f11600fe7d')

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
