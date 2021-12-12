# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='Compass-Points'
_projectauthor='JANUS'
pkgname="perl-${_projectname,,}"
pkgver='0.02'
pkgrel='1'
pkgdesc='Convert between compass point names, abbreviations and values'
arch=('any')
url="https://metacpan.org/dist/$_projectname"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/${_projectauthor::1}/${_projectauthor::2}/$_projectauthor/$_projectname-$pkgver.tar.gz")
sha512sums=('92fecbe5868aaae24662b0c856e0a1fed2b80d6bcf9c03fba05cee3bd4117b69c3b79933c0d3b26e145bda589cbafbb44565b0451661b0012cfbd4e38ce070d2')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

	perl 'Makefile.PL'
	make
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1

	make test
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT

	make install INSTALLDIRS='vendor' DESTDIR="$pkgdir"
}
