# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-glib-ev
pkgver=2.02
pkgrel=4
pkgdesc="Coerce Glib into using the EV module as event loop"
arch=('i686' 'x86_64')
url='http://search.cpan.org/perldoc?Glib::EV'
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/Glib-EV-${pkgver}.tar.gz")
depends=('glib-perl' 'perl-ev')
md5sums=('550417252d37af703095855aadbf8558')

build() {
	cd "$srcdir/Glib-EV-$pkgver"

	# install module in vendor directories
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}
package() {
	cd "$srcdir/Glib-EV-$pkgver"
	make install DESTDIR="$pkgdir/"

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
