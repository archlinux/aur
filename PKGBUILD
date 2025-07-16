# Maintainer: Christian Hesse <arch@eworm.de>
# Contributor: Erik Johnson (palehose at gmail dot com)

pkgname=perl-string-random
pkgver=0.32
pkgrel=5
pkgdesc='Perl module to generate random strings based on a pattern'
arch=('any')
url='https://metacpan.org/pod/String::Random'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-module-build')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/String-Random-${pkgver}.tar.gz")
sha256sums=('9d93c679a34ffa26d3b4fa0837caed1cd2e67d76572818b91e97dea734705246')

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

