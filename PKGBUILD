# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Georg Grabler (STiAT) <ggrabler@gmail.com>

pkgname=perl-dbd-oracle
pkgver=1.90
pkgrel=2
pkgdesc="DBD::Oracle - Oracle database driver for the DBI module"
arch=('any')
url="http://search.cpan.org/dist/DBD-Oracle"
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=('oracle-instantclient-basic' 'perl-dbi')
makedepends=('oracle-instantclient-sdk' 'oracle-instantclient-sqlplus')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/Z/ZA/ZARQUON/DBD-Oracle-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}_fix.patch::https://patch-diff.githubusercontent.com/raw/perl5-dbi/DBD-Oracle/pull/177.patch?full_index=1")
sha256sums=('2fcfdf5f1c2775d1a2e5f4d86d2a9d8dcf8f49792f6ce465b828b16df6d100cf'
            '607ff4357f59ce947bfc64aff8ce2ef6fb23c18adafbb77e4e1c8a9b6ffdbdad')

prepare() {
	if [[ -z ${ORACLE_HOME} ]]; then
		echo "No Oracle / Instant Client installation found"
		exit 1
	fi
	patch -d "DBD-Oracle-${pkgver}" -Np1 -i ../perl-dbd-oracle-1.90_fix.patch 
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
