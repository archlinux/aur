# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-data-flow
pkgver='1.02'
pkgrel=2
pkgdesc="Perl extension for simple-minded recipe-controlled build of data"
arch=('i686' 'x86_64')
url='http://search.cpan.org/perldoc?Data::Flow'
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/I/IL/ILYAZ/modules/Data-Flow-${pkgver}.tar.gz")
depends=('perl')
md5sums=('aa453ab013681206bccf43e8e267d63b')

build() {
	cd "$srcdir/Data-Flow-$pkgver"

	# install module in vendor directories
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}
package() {
	cd "$srcdir/Data-Flow-$pkgver"
	make install DESTDIR="$pkgdir/"

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
