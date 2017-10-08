# Maintainer: Bruno Dupuis <lisael@lisael.org>
# Contributor: Jan Tojnar <jtojnar@gmail.com>
pkgname=perl-test-dir
pkgver=1.16
pkgrel=1
pkgdesc='test directory attributes'
_dist=Test-Dir
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('perl_5')
depends=(
    'perl'
    'perl-module-install'
)
checkdepends=(
    'perl-test-pod'
    'perl-test-pod-coverage'
)

options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/M/MT/MTHURN/$_dist-$pkgver.tar.gz")
sha512sums=('d0f22091e834ffc1111f9a56ecbd38c95c2e593ab680cf342744b8344c0c4dfd1bcbfe1ba753b23b420b089aa855c1b2b4a183fd8458c95a9cc6506123ec0a23')

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
