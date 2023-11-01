# Maintainer: Sean Anderson <seanga2@gmail.com>
_dist=Regexp-Wildcards
pkgname=perl-regexp-wildcards
pkgver=1.05
pkgrel=2
pkgdesc="Convert wildcard expressions to Perl regular expressions"
arch=(any)
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(
	perl
	perl-scalar-list-utils
	perl-text-balanced
)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/V/VP/VPIT/$_dist-$pkgver.tar.gz")
sha512sums=('e67b91f8c879c48d5d7c25304ca9978a2c22aba066ce34648bb172c5c3567aefb679a0767987a1e21106833093ae860c2b1c486d0c7fb48df086a32e581cc17c')

build() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	/usr/bin/perl Makefile.PL
	make
}

check() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	make test
}

package() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
