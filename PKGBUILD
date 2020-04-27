# CPAN Name  : PDL
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

# Contributor: András Wacha < awacha at gmail>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: carltonf <xiong[c05]@gmail.com>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=perl-pdl-nohdf4
pkgver=2.019
pkgrel=1
pkgdesc='The Perl Data Language, a perl extension designed for scientific and bulk numeric data processing and display'
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/PDL'
license=('PerlArtistic' 'GPL')
depends=(
	'perl>=5.8.9'
	'perl-inline>=0.43'
	'gsl'
	'perl-inline-c'
	'perl-astro-fits-header'
	'perl-convert-uu'
	'perl-file-map'
	'perl-module-compile'
)
provides=('perl-pdl=${pkgver}')
conflicts=('perl-pdl')
makedepends=(
	'perl>=5.11.3' # To provide ExtUtils::MakeMaker 6.56
	'fftw2'
	'perl-opengl'
	'perl-devel-checklib'
#	'plplot'
#	'perl-extutils-f77'
	'proj'
)
checkdepends=(
	'perl-test-warn' 'perl-test-exception' 'perl-test-deep' 'perl-list-moreutils'
)
optdepends=(
	'fftw2: for PDL::FFTW support'
	'perl-astro-fits-header: improved FITS files support'
	'perl-convert-uu: for the case when something wrong with Unicode support'  # It is necessary on *BSD systems
	'perl-extutils-f77: for PDL::Slatec and PDL::Minuit support'               # It is not necessary at runtime
	'perl-opengl>=0.6703: for PDL::Graphics::TriD support'
	'plplot: for PDL::Graphics::PLplot support'
	'proj: for PDL::GIS::Proj and PDL::Transform::Proj4 support'
)

source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHM/PDL-${pkgver}.tar.gz)
options=(!emptydirs)
sha256sums=('51a47beedb1dd5bb4b6f6441a0ad38d4c95d7cbf3bf6b1b4c9128732ea2d77fe')

build() {
	cd PDL-${pkgver}
	F77LIBS='-lgfortran -lm' PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd PDL-${pkgver}
	make test
}

package() {
	cd PDL-${pkgver}
	mkdir -p "${pkgdir}/usr/lib/perl5/$(perl -e 'print substr($^V,1,4)')/vendor_perl/PDL"
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
