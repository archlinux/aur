# CPAN Name  : Authen-Simple-LDAP
# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=perl-authen-simple-ldap
pkgver=0.3
pkgrel=3
pkgdesc="Authen-Simple-LDAP for Perl"
arch=('any')
url="http://search.cpan.org/~chansen/Authen-Simple-LDAP-${pkgver}/"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-ldap' 'perl-authen-simple')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/C/CH/CHANSEN/Authen-Simple-LDAP-${pkgver}.tar.gz")
sha256sums=('9c79d515240d927ecf848587b5c2bb91564e390278b7386f6f77d3d6bf8aa881')

build() {
	cd "${srcdir}/Authen-Simple-LDAP-${pkgver}"

	export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1

	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "${srcdir}/Authen-Simple-LDAP-${pkgver}"

	make test
}

package() {
	cd "${srcdir}/Authen-Simple-LDAP-${pkgver}"

	make DESTDIR="${pkgdir}" install

	find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

