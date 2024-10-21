# Maintainer: Sean Anderson <seanga2@gmail.com>
_dist=MooX-Aliases
pkgname=perl-moox-aliases
pkgver=0.001006
pkgrel=2
pkgdesc="easy aliasing of methods and attributes in Moo"
arch=(any)
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(
	perl
	perl-class-method-modifiers
	perl-moo
	perl-strictures
)
checkdepends=(
	perl-test-fatal
)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/$_dist-$pkgver.tar.gz")
sha512sums=('18bfdad2620e0e2fbe9e7667929ac2a2e3b9dee262348c957b6a6f2d7d0016988bb4f0ef6141ae0bd77eca74e0528ec298590efef219e3beebda69f0528fe717')

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
