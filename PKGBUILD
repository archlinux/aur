# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-c-scan
pkgver='0.74'
pkgrel=3
pkgdesc="scan C language files for easily recognized constructs"
arch=('any')
url='http://search.cpan.org/perldoc?C::Scan'
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/H/HV/HVDS/C-Scan-${pkgver}.tar.gz")
depends=()
md5sums=('a229ce3836ba72f9b4cc3d1fb6392edb')

build() {
	cd "$srcdir/C-Scan-$pkgver"

	# install module in vendor directories
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}
package() {
	cd "$srcdir/C-Scan-$pkgver"
	make install DESTDIR="$pkgdir/"

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
