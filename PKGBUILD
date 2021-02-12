# Maintainer: Berto Gomez <csberto at gmail dot com>
# Contributor: Jan Tojnar <jtojnar@gmail.com>
pkgname=perl-config-gitlike
pkgver=1.17
pkgrel=1
pkgdesc='git-compatible config file parsing'
_dist=Config-GitLike
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('perl_5')
depends=('perl-moo' 'perl-moox-types-mooselike' 'perl' 'perl-module-install')
checkdepends=('perl-test-exception')

options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/A/AL/ALEXMV/$_dist-$pkgver.tar.gz")
sha512sums=('22f63681753b38e881170a605697cbf62b46d074dfeacc00549d25a043254f15ba18e8c73f57dc6d0255702ae3b1078af969b51c9663636375990a86664f18b8')

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
