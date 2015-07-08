# Maintainer: Christian Hesse <arch@eworm.de>
# Contributor: Erik Johnson (palehose at gmail dot com)

pkgname=perl-string-random
pkgver=0.26
pkgrel=3
pkgdesc='Perl module to generate random strings based on a pattern'
arch=('any')
url='https://metacpan.org/pod/String::Random'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-module-build')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/String-Random-${pkgver}.tar.gz")
sha256sums=('d2fca6c3a54002b9a41d1888672db5a00c9e63deae041d992473544a3364b7f7')

build() {
	cd "${srcdir}/String-Random-${pkgver}"

	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
		PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'" \
		PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
		MODULEBUILDRC=/dev/null

	/usr/bin/perl Build.PL INSTALLDIRS=vendor
	./Build
}

check() {
	cd "${srcdir}/String-Random-${pkgver}"

	./Build test
}

package() {
	cd "${srcdir}/String-Random-${pkgver}"

	./Build install

	# remove perllocal.pod and .packlist
	find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

