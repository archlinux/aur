# Maintainer: Sergei Zhmylev <zhmylove@narod.ru>

pkgname=perl-anyevent-dbus
_cpanname='AnyEvent-DBus'
pkgver=0.31
pkgrel=1
pkgdesc="Adaptor to integrate Net::DBus into AnyEvent"
arch=('any')
url='http://search.cpan.org/perldoc?AnyEvent::DBus'
license=('PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/${_cpanname}-${pkgver}.tar.gz")
depends=('perl-net-dbus' 'perl-common-sense' 'perl-anyevent')
md5sums=('c471100db7288b836768588b3fa92a86')
sha512sums=('3db3667f0d79d0de4e6e95ff8f7dbbca3244fd3b0e60e3bb1b0497e9d9141630956c664e5780bd70f0c58cabf4f5a61eadb61f6e607a544f0c4207712256f2be')

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
