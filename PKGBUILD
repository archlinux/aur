# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Georg Grabler (STiAT) <ggrabler@gmail.com>

pkgname=perl-dbd-oracle
pkgver=1.83
pkgrel=1
pkgdesc="DBD::Oracle - Oracle database driver for the DBI module"
arch=('any')
url="http://search.cpan.org/dist/DBD-Oracle"
license=('GPL' 'PerlArtistic')
depends=('oracle-instantclient-basic' 'perl-dbi')
makedepends=('oracle-instantclient-sdk' 'oracle-instantclient-sqlplus')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/Z/ZA/ZARQUON/DBD-Oracle-${pkgver}.tar.gz")
sha256sums=('51fe9c158955fda0ca917a806863f0bc51068b533fbbc7423b3cc4ad595ed153')

prepare() {
	if [[ -z ${ORACLE_HOME} ]]; then
		error "No Oracle / Instant Client installation found."
	fi
}

build() {
	cd "DBD-Oracle-${pkgver}"
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

package() {
	cd "DBD-Oracle-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
