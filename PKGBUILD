# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-anyevent-snmp
_cpanname='AnyEvent-SNMP'
pkgver=6.0
pkgrel=2
pkgdesc="Adaptor to integrate Net::SNMP into AnyEvent"
arch=('any')
url='http://search.cpan.org/perldoc?AnyEvent::SNMP'
license=('PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/${_cpanname}-${pkgver}.tar.gz")
depends=('perl-net-snmp' 'perl-anyevent')
md5sums=('1112752d9df30da320116788372c64e3')

build() {
	cd "$srcdir/${_cpanname}-$pkgver"

	# install module in vendor directories
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}
package() {
	cd "$srcdir/${_cpanname}-$pkgver"
	make install DESTDIR="$pkgdir/"

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
