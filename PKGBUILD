# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-net-ipaddress
_cpanname=Net-IPAddress
pkgver=1.10
pkgrel=3
pkgdesc="Net::IPAddress - Functions used to manipulate IP addresses, masks and FQDNs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url="https://metacpan.org/module/Net::IPAddress"
source=("http://cpan.metacpan.org/authors/id/S/SA/SARENNER/${_cpanname}-${pkgver}.tar.gz")
md5sums=('512117d3f6bcc027bd11f70d71f6f844')

build() {
	cd "$srcdir/${_cpanname}-$pkgver"
	# install module in vendor directories
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
	make
}
package() {
	cd "$srcdir/${_cpanname}-$pkgver"
	make install DESTDIR="$pkgdir/" || return 1
	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
