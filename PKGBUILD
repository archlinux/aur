# Maintainer: Sean Anderson <seanga2@gmail.com>
_dist=Time-Moment
pkgname=perl-time-moment
pkgver=0.44
pkgrel=2
pkgdesc="Encoding and decoding of UTF-8 encoding form"
arch=(x86_64)
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(
	perl
	perl-test-requires
)
checkdepends=(perl-test-number-delta)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/C/CH/CHANSEN/$_dist-$pkgver.tar.gz")
sha512sums=('637e33f7e6874185ddaa592e309737c0871e2651efacce03213a168002908a81f18be913e1df2709d9246f2a1dcb8eb1ed445365974542b0c6bcb5082867153e')

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
