# Contributor: Antonio Muñoz <agmconejo AT gmail DOT com>

pkgname=perl-ora2pg
pkgver=23.1
pkgrel=1
pkgdesc="Ora2Pg - Oracle to PostgreSQL database schema converter"
arch=('any')
url="http://ora2pg.darold.net"
license=('GPL' 'PerlArtistic')
depends=('perl')
optdepends=('perl-dbd-oracle: connect to an Oracle db'
            'perl-dbd-pg: connect to a PostgreSQL db'
            'perl-dbd-mysql: connect to a MySQL db')
options=('!emptydirs')
source=("https://github.com/darold/ora2pg/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e6c0e92ae9058c14480ec4a26db60796714a721eaf223ac53e1fe4e37d9ce2f6')

build() {
	cd "ora2pg-${pkgver}"
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL DESTDIR=${pkgdir} INSTALLDIRS=vendor
	make
}

package() {
	cd "ora2pg-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	mv ${pkgdir}/etc/ora2pg/ora2pg.conf{.dist,}
	sed -i "s#${pkgdir}##" ${pkgdir}/usr/bin/vendor_perl/ora2pg
}
