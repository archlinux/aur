# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-io-interface
pkgver='1.09'
pkgrel=1
pkgdesc="Perl extension for access to network card configuration information"
arch=('i686' 'x86_64')
url='http://search.cpan.org/perldoc?IO::Interface'
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/L/LD/LDS/IO-Interface-${pkgver}.tar.gz")
depends=('glibc')
md5sums=('806f97aff5a7361b6f54cd494f4cc9fd')

build() {
	cd "$srcdir/IO-Interface-$pkgver"

	# install module in vendor directories
	perl Build.PL --installdirs vendor
	./Build
}
package() {
	cd "$srcdir/IO-Interface-$pkgver"
	./Build --installdirs vendor destdir="$pkgdir/" install

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
