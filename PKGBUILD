# Maintainer: Sean Anderson <seanga2@gmail.com>
_dist=Syntax-Keyword-Try
pkgname=perl-syntax-keyword-try
pkgver=0.29
pkgrel=1
pkgdesc="a try/catch/finally syntax for perl"
arch=(x86_64)
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-xs-parse-keyword)
makedepends=(perl-module-build)
checkdepends=(perl-test2-suite)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/$_dist-$pkgver.tar.gz")
sha512sums=('269ea66916c39852262bc60b1661e90adf55489f1369a745a3c3ba24dd4335203a46d8bf8ddd39dcdefc4ae3314ce06b1fa7956d0a4bd23bba6fb809adaa1814')

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
