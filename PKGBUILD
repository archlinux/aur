# CPAN Name  : Alien::GSL
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-alien-gsl
pkgver=1.02
pkgrel=1
pkgdesc='Building, finding and using GSL library'
arch=('any')
url='https://metacpan.org/release/Alien-GSL'
license=('PerlArtistic' 'GPL')
makedepends=('perl-module-build>=0.38' 'perl-alien-base-modulebuild' 'perl-net-ssleay'
	'perl-io-socket-ssl')
depends=('perl-alien-build' 'gsl')
source=(http://search.cpan.org/CPAN/authors/id/J/JB/JBERGER/Alien-GSL-1.02.tar.gz)
options=(!emptydirs)
md5sums=('91ad561f5420e59a70a09ae7bb0a806d')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Alien-GSL-1.02
	sanitize
	/usr/bin/perl Build.PL --installdirs vendor --destdir "$pkgdir"
	/usr/bin/perl Build
}

check() {
	cd Alien-GSL-1.02
	sanitize
	/usr/bin/perl Build test
}

package() {
	cd Alien-GSL-1.02
	sanitize
	/usr/bin/perl Build install
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
