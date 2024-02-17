# Maintainer: Sean Anderson <seanga2@gmail.com>
_dist=Text-Markdown-Discount
pkgname=perl-text-markdown-discount
pkgver=0.16
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
sha512sums=('4175fe71b94ec7b9aa11a0c25b963f3a3cca606d63db757fd1156aff30f50cc8253d0ae18241b4129a89855c843b1ff275297b70a18d6c59bf11769d6d159ae2')

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
