# Maintainer: Caleb Maclennan< caleb@alerque.com>
# Contributor: GPP <gergan@gmail.com>

_cpan=Test-Most
pkgname=perl-${_cpan,,}
pkgver=0.37
pkgrel=3
pkgdesc='Most commonly needed test functions and features'
arch=(any)
url=https://metacpan.org/release/$_cpan
license=(GPL PerlArtistic)
_perldeps=(exception-class
           test-deep
           test-differences
           test-exception
           test-warn)
depends=(perl
         "${_perldeps[@]/#/perl-}")
options=(!emptydirs)
_archive="$_cpan-$pkgver"
source=("https://cpan.perl.org/modules/by-module/${_cpan%-*}/$_archive.tar.gz")
sha256sums=('533370141eb9f18cf4ac380f6ded2ab57802a6e184008a80fd2304bfcc474fc7')

build() {
	cd "$_archive"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	perl Makefile.PL
	make
}

check() {
	cd "$_archive"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	make test
}

package() {
	cd "$_archive"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
