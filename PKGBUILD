# Maintainer: Sean Anderson <seanga2@gmail.com>
_dist=Syntax-Keyword-Try
pkgname=perl-syntax-keyword-try
pkgver=0.27
pkgrel=1
pkgdesc="a try/catch/finally syntax for perl"
arch=(x86_64)
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-xs-parse-keyword)
makedepends=(perl-module-build)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/$_dist-$pkgver.tar.gz")
sha512sums=('794a8df77bfa255b83deb7004ca2a70e5f9ec76e6009897101a20c11e8969f4238bed578de5fb510590730be7dfb8b2d1431f8955863f217f7fc5a639e2f2e3b')

build() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
	/usr/bin/perl Build.PL
	./Build
}

check() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	./Build test
}

package() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	./Build install --installdirs=vendor --destdir="$pkgdir"
}
