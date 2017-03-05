# CPAN Name  : ExtUtils::F77
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-extutils-f77
pkgver=1.20
pkgrel=1
pkgdesc='Perl module providing simple interface to F77 libraries'
arch=('any')
url='https://metacpan.org/release/ExtUtils-F77'
license=('PerlArtistic' 'GPL')
depends=('perl' 'gcc-fortran')
source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHM/ExtUtils-F77-1.20.tar.gz)
options=(!emptydirs)
md5sums=('df37ee4070908e55d038b2d26d27ef50')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd ExtUtils-F77-1.20
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd ExtUtils-F77-1.20
	sanitize
	F77LIBS='-lgfortran -lm' make test
}

package() {
	cd ExtUtils-F77-1.20
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
