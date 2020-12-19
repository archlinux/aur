# Maintainer: Berto Gomez <csberto at gmail dot com>
# Contributor: Jan Tojnar <jtojnar@gmail.com>
pkgname=perl-config-gitlike
pkgver=1.16
pkgrel=2
pkgdesc='git-compatible config file parsing'
_dist=Config-GitLike
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('perl_5')
depends=('perl-moo' 'perl-moox-types-mooselike' 'perl' 'perl-module-install')
checkdepends=('perl-test-exception')

options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/A/AL/ALEXMV/$_dist-$pkgver.tar.gz")
sha512sums=('ec8d9302f10c2eaab900e4a44b588644e52c28a120d7dac443e7362b6338cd7ced86998ccbf74a33060f84e419609dd2d25f32acbee0866193c73d62166ab154')

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
