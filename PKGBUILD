pkgname='perl-mojolicious-plugin-canonicalurl'
pkgver='0.06'
pkgrel='1'
pkgdesc="Ensures canonical URLs via redirection"
_dist='Mojolicious-Plugin-CanonicalURL'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-quote' 'perl-mojolicious')
makedepends=('perl-mojolicious' 'perl-module-build-tiny')
url='http://search.cpan.org/dist/Mojolicious-Plugin-CanonicalURL'
source=("https://cpan.metacpan.org/authors/id/S/SR/SRCHULO/$_dist-$pkgver.tar.gz")
sha512sums=('e1473a7a94e1e63d594aaa59245f70787ab9998470211ad6017c9da9c3834ee0e68d8348d13691b44ec5fc448fc35f77aeeddddeb3d3c2cb08fc68ebb97d5cb3')
_distdir="$_dist-$pkgver"

build() {
	cd "$srcdir/$_distdir"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
	/usr/bin/perl Build.PL
	./Build
}

check() {
	cd "$srcdir/$_distdir"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	./Build test
}

package() {
	cd "$srcdir/$_distdir"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	./Build install --installdirs=vendor --destdir="$pkgdir"
}
