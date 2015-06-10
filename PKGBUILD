# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-log-tree
_cpanname=Log-Tree
pkgver=0.15
pkgrel=1
pkgdesc="Perl/CPAN Module Log::Tree - lightweight but highly configuration logging class"
arch=(any)
url="https://metacpan.org/release/$_cpanname"
license=(PerlArtistic)
options=('!emptydirs')
depends=(perl-data-tree perl-io-interactive perl-log-dispatch perl-moose perl-namespace-autoclean)
source=("http://cpan.metacpan.org/authors/id/T/TE/TEX/$_cpanname-$pkgver.tar.gz")
md5sums=('98a80b40924f6cae9ae816ad9ab0fcdf')

build() {
	cd "$srcdir/$_cpanname-$pkgver"

	# install module in vendor directories
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}
package() {
	cd "$srcdir/$_cpanname-$pkgver"
	make install DESTDIR="$pkgdir/"

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
