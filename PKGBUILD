# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-io-interface
pkgver='1.06'
pkgrel=2
pkgdesc="Perl extension for access to network card configuration information"
arch=('i686' 'x86_64')
url='http://search.cpan.org/perldoc?IO::Interface'
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/L/LD/LDS/IO-Interface-${pkgver}.tar.gz")
depends=('perl')
md5sums=('7d77d0f23ee7f577109fc5f0e67e0a4b')

build() {
	cd "$srcdir/IO-Interface-$pkgver"

	# install module in vendor directories
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}
package() {
	cd "$srcdir/IO-Interface-$pkgver"
	make install DESTDIR="$pkgdir/"

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
