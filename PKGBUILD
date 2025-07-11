# Maintainer: Sean Anderson <seanga2@gmail.com>
_dist=Text-Markdown-Discount
pkgname=perl-text-markdown-discount
pkgver=0.18
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
source=("https://cpan.metacpan.org/authors/id/S/SO/SONGMU/$_dist-$pkgver.tar.gz")
sha512sums=('3af7113676b897d9f0b1fdd35906e4f622797fdb0b942975678a0072f8e780bd630a903151acdc33899a34272c3d83106d85603a2a26096acc05c74e65ff7e71')

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
