# Maintainer:  Nigel Kukard <nkukard@lbsd.net>
# Contributor: Anonymous

pkgname=perl-xml-rpc
pkgver=1.1
pkgrel=1
pkgdesc="Pure Perl implementation for an XML-RPC client and server"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww' 'perl-xml-treepp')
makedepends=()
url='https://metacpan.org/release/XML-RPC'
source=('https://cpan.metacpan.org/authors/id/C/CA/CAVAC/XML-RPC-1.1.tar.gz')
md5sums=('9386a80df38f838a29420a922429496e')
sha512sums=('163ec99c6c7dd75db5389320d6aeace56ba9313870f6c5c9633669f413ac2f0feace9c472ac35d51cef092d36e7a2ac306d19478b8257233ad5a6ddb5401c00e')
_distdir="XML-RPC-$pkgver"

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

