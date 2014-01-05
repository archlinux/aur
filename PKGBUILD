# CPAN Name  : PDL
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: carltonf <xiong[c05]@gmail.com>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=perl-pdl
pkgver=2.007
pkgrel=1
pkgdesc='The Perl Data Language, a perl extension designed for scientific and bulk numeric data processing and display'
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/PDL'
license=('PerlArtistic' 'GPL')
depends=(
	'perl>=5.8.9'
	'perl-inline>=0.43'
	'gsl'
)
makedepends=(
	'perl>=5.11.3' # To provide ExtUtils::MakeMaker 6.56
	'fftw2'
	'hdf4'
	'perl-opengl>=0.6703'
	'plplot'
	'perl-extutils-f77'
	'proj'
)
checkdepends=(
	'perl-test-warn'
)
optdepends=(
	'fftw2: for PDL::FFTW support'
	'hdf4: for HDF files support'
	'perl-astro-fits-header: improved FITS files support'
#	'perl-convert-uu: for the case when something wrong with Unicode support'  # It is necessary on *BSD systems
#	'perl-extutils-f77: for PDL::Slatec and PDL::Minuit support'               # It is not necessary at runtime
	'perl-opengl>=0.6703: for PDL::Graphics::TriD support'
	'plplot: for PDL::Graphics::PLplot support'
	'proj: for PDL::GIS::Proj and PDL::Transform::Proj4 support'
)

source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHM/PDL-2.007.tar.gz perldl.conf)
changelog='ChangeLog'
options=(!emptydirs)
md5sums=('ea343d3569ce02dbeadf1f58d700656f' '8e1f6285ce4ee9439dc1088709cfec18')

build() {
	cd PDL-2.007
	F77LIBS='-lgfortran -lm' PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor PDLCONF=$srcdir/perldl.conf
	make
}

check() {
	cd PDL-2.007
	make test
}

package() {
	cd PDL-2.007
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
