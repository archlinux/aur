# Maintainer: Sean Anderson <seanga2@gmail.com>
_dist=Iterator-Util
pkgname=perl-iterator-util
pkgver=0.02
pkgrel=2
pkgdesc="essential utilities for the Iterator class"
arch=(any)
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(
	perl
	perl-iterator
	perl-test-simple
)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/R/RO/ROODE/$_dist-$pkgver.tar.gz")
sha512sums=('c37a216b2aaf1e3ee9c69837e12d315121119b96a125ae74edb60762392290aed7c32c118edde2f995a619b913946bd65685f8c4e577834ff4e66f80883339ca')

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
