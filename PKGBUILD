# Maintainer: Jan Tojnar <jtojnar@gmail.com>
pkgname=perl-test-dir
pkgver=1.014
pkgrel=1
pkgdesc='test directory attributes'
_dist=Test-Dir
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('perl_5')
depends=('perl')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')

options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/M/MT/MTHURN/$_dist-$pkgver.tar.gz")
sha512sums=('d314ad2aea917550b47af75845ac74c5dbf838881f98fa7d38c6dabbd4e5bad2c21ae2bca569bd55cf3a9fa180dc37a847693af0fcf43956deb6413beff0066a')

build() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	/usr/bin/perl Makefile.PL
	make
}

check() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	make test
}

package() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
