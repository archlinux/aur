# CPAN Name  : Authen-Simple
# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=perl-authen-simple
pkgver=0.5
pkgrel=9
pkgdesc='Authen-Simple for Perl'
arch=('any')
url='https://metacpan.org/release/Authen-Simple'
license=('PerlArtistic' 'GPL')
makedepends=('perl-module-install')
depends=('perl' 'perl-try-tiny' 'perl-params-validate' 'perl-class-accessor' 'perl-class-data-inheritable' 'perl-passwd-md5')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/C/CH/CHANSEN/Authen-Simple-${pkgver}.tar.gz")
sha256sums=('02cddab47f8bf1a1cbd4c9bf8d258f6d05111499c33f8315e7244812f72613aa')

build() {
	cd "${srcdir}/Authen-Simple-${pkgver}"

	export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1

	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "${srcdir}/Authen-Simple-${pkgver}"

	make test
}

package() {
	cd "${srcdir}/Authen-Simple-${pkgver}"

	make DESTDIR="${pkgdir}" install

	find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

