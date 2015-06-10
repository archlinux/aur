# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-net-snmp-ev
pkgver=0.12
pkgrel=3
pkgdesc="EV event loop for Net-SNMP"
arch=('any')
url='http://search.cpan.org/perldoc?Net::SNMP::EV'
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/Net-SNMP-EV-0.12.tar.gz")
depends=('perl-net-snmp' 'perl-ev')
md5sums=('74d887e49914a5ab48fa1f07094b08ac')

build() {
	cd "$srcdir/Net-SNMP-EV-$pkgver"

	# install module in vendor directories
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}
package() {
	cd "$srcdir/Net-SNMP-EV-$pkgver"
	make install DESTDIR="$pkgdir/"

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
