# Maintainer: Sean Anderson <seanga2@gmail.com>
_dist=Text-Markdown-Discount
pkgname=perl-text-markdown-discount
pkgver=0.13
pkgrel=1
pkgdesc="fast function for converting markdown to HTML"
arch=(any)
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(
	perl
	discount
)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/S/SE/SEKIMURA/$_dist-$pkgver.tar.gz")
sha512sums=('688cbbc73f8e67f9908ad3a46445b7c68069dcbf0350f77f65cf9c5ddc8de3522ff2c937d37cc5dc12b26201f8f6c8886032f054f112684006060070f97d17cf')

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
