# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-data-tree
_cpanname=Data-Tree
pkgver=0.16
pkgrel=1
pkgdesc="Perl/CPAN Module Data::Tree - a hash-based tree-like data structure"
arch=(any)
url="https://metacpan.org/release/$_cpanname"
license=(PerlArtistic)
options=('!emptydirs')
depends=(perl-moose perl-namespace-autoclean)
source=("http://cpan.metacpan.org/authors/id/T/TE/TEX/$_cpanname-$pkgver.tar.gz")
md5sums=('d0ec6733d2a2f2f57cc1c920f10c7dc6')

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
