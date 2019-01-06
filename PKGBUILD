# Maintainer: Nigel Kukard <nkukard@lbsd.net>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-io-prompt
pkgver=0.997004
pkgrel=1
pkgdesc="Interactively prompt for user input"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-term-readkey' 'perl-want')
makedepends=()
url='https://metacpan.org/release/IO-Prompt'
source=('https://cpan.metacpan.org/authors/id/D/DC/DCONWAY/IO-Prompt-0.997004.tar.gz')
md5sums=('24d7c674fd8ec43edf8a05eeb068fc3a')
sha512sums=('a3624ae807b88493231e3de5ad2bff78927924fa72db68828cdbe69fd54c9a38f6fd7e39d9cddf1e82e60614ddaacbcdef1ba08e4af6713d899077b141d8b2e6')
_distdir="IO-Prompt-$pkgver"


build() {
	(
		export PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
			PERL_AUTOINSTALL=--skipdeps \
			PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
			PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
			MODULEBUILDRC=/dev/null

		cd "$srcdir/$_distdir"
		/usr/bin/perl Makefile.PL
		make
	)
}

check() {
	cd "$srcdir/$_distdir"
	(
		export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
		make test
	)
}

package() {
	cd "$srcdir/$_distdir"
	make install

	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

