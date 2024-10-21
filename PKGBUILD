# Maintainer: Sean Anderson <seanga2@gmail.com>
_dist=version
pkgname=perl-version
pkgver=0.9933
pkgrel=1
pkgdesc="Perl extension for Version Objects "
arch=(any)
url="https://metacpan.org/dist/$_dist"
license=('GPL' 'PerlArtistic')
depends=(
	perl
	perl-scalar-list-utils
	perl-text-balanced
)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/L/LE/LEONT/$_dist-$pkgver.tar.gz")
sha512sums=('cfb991c03da6240949a926c7cfac0fa61ff31cc6340e10c5b4d485188c4b53e34dbaadadeae7bcc6808bfb48a794d89cb0210fafb8c7a176cd7c8c3b7160ac97')

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
