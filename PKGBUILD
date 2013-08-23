# CPAN Name  : PDL
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: carltonf <xiong[c05]@gmail.com>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=perl-pdl
pkgver=2.006
pkgrel=2
pkgdesc='The Perl Data Language, a perl extension designed for scientific and bulk numeric data processing and display'
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/PDL'
license=('PerlArtistic' 'GPL')
depends=(
	'perl>=5.8.9'       # To provide ExtUtils::MakeMaker 3.61
	'perl-inline>=0.43'
	'gsl'
)
makedepends=(
	'fftw2'
	'hdf4'
	'perl-opengl>=0.63'
	'plplot'
	'perl-extutils-f77'
	'proj'
)
optdepends=(
	'fftw2: for PDL::FFTW support'
	'hdf4: for HDF files support'
	'perl-astro-fits-header: improved FITS files support'
#	'perl-convert-uu: for the case when something wrong with Unicode support'  # It is necessary on *BSD systems
#	'perl-extutils-f77: for PDL::Slatec and PDL::Minuit support'               # It is not necessary at runtime
	'perl-opengl>=0.63: for PDL::Graphics::TriD support'
	'plplot: for PDL::Graphics::PLplot support'
	'proj: for PDL::GIS::Proj and PDL::Transform::Proj4 support'
)

source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHM/PDL-2.006.tar.gz perldl.conf pdl-tests.patch)
changelog='ChangeLog'
options=(!emptydirs)
md5sums=('df54b730453325be36b2e98ffe1f004d' '9caa2b89a7f7aabfd7dcfb2c1ef79bc9' 'a376497f3426ca19ea81a01c2c4f95c2')

build() {
	cd "$srcdir/PDL-2.006"
	patch -i $srcdir/pdl-tests.patch -p1
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor PDLCONF=$srcdir/perldl.conf
	make
}

check() {
	cd "$srcdir/PDL-2.006"
	make test
}

package() {
	cd "$srcdir/PDL-2.006"
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
