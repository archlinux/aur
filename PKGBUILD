# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-io-interface
pkgver=1.09
pkgrel=7
pkgdesc="Perl extension for access to network card configuration information"
arch=('i686' 'x86_64')
url='http://search.cpan.org/perldoc?IO::Interface'
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/L/LD/LDS/IO-Interface-${pkgver}.tar.gz")
depends=('glibc')
makedepends=('perl-module-build')
md5sums=('806f97aff5a7361b6f54cd494f4cc9fd')

build() {
	cd "$srcdir/IO-Interface-$pkgver"

	# install module in vendor directories
	perl Build.PL --installdirs vendor
	./Build
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
	cd "$srcdir/IO-Interface-$pkgver"
	./Build --installdirs vendor destdir="$pkgdir/" install

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
	_perl_depends
}
