# Maintainer: fbabetto

pkgname=perl-text-multimarkdown
pkgver=1.000035
pkgrel=1
pkgdesc="Perl/CPAN Module Text-MultiMarkdown"
_dist="Text-MultiMarkdown"
arch=('any')
url="http://search.cpan.org/dist/Text-MultiMarkdown/"
license=('BSD')
depends=('perl' 'perl-text-markdown')
makedepends=('perl-list-moreutils')
checkdepends=('perl-test-exception' 'perl-test-pod' 'perl-test-pod-coverage')
# FIXME MAYBE test-exception is in MAKEDEPENDS http://cpansearch.perl.org/src/BOBTFISH/Text-MultiMarkdown-1.000034/Makefile.PL
# FIXME 'perl-test-spelling' is a checkdepends but it fails to build
source=(http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/$_dist-$pkgver.tar.gz)
md5sums=('dba21e6489e2a83a7534fe5b5b0daa8c')


build() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make test
}

package() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make DESTDIR="$pkgdir/" install
	install -Dm644 "License.text" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
