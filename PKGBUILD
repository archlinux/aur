# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-ev-glib
pkgver=2.01
pkgrel=13
pkgdesc="Embed the glib main loop into EV"
arch=('i686' 'x86_64')
url='http://search.cpan.org/perldoc?EV::Glib'
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/EV-Glib-${pkgver}.tar.gz")
depends=('glib-perl' 'perl-ev')
makedepends=('perl-extutils-pkgconfig')
md5sums=('20c0196095062a5e0f27a455ac32d8f5')

build() {
	cd "$srcdir/EV-Glib-$pkgver"

	# install module in vendor directories
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}
_perl_depends() {
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}
package() {
	cd "$srcdir/EV-Glib-$pkgver"
	make install DESTDIR="$pkgdir/"

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
	_perl_depends
}
