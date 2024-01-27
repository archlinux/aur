# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='Compass-Points'
_projectauthor='JANUS'
pkgname="perl-${_projectname,,}"
pkgver='0.02'
pkgrel='2'
pkgdesc='Convert between compass point names, abbreviations and values'
arch=('any')
url="https://metacpan.org/dist/$_projectname"
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=('perl')
options=('!emptydirs')
source=(
	"$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/${_projectauthor::1}/${_projectauthor::2}/$_projectauthor/$_projectname-$pkgver.tar.gz"
	"$pkgname-$pkgver-LICENSE::https://www.gnu.org/licenses/old-licenses/gpl-1.0.txt"
)
sha512sums=('92fecbe5868aaae24662b0c856e0a1fed2b80d6bcf9c03fba05cee3bd4117b69c3b79933c0d3b26e145bda589cbafbb44565b0451661b0012cfbd4e38ce070d2'
            'e239b539f2c46c1ae3da87c4983a0fda67dc8ae622d607b507b5c523af3bdf99e7bea8931e3a7c6007910bfe9e21a761e03e8203de95b5aceea425a97d0a84c9')

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

	install -Dm644 "../$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/GPL-1.0-or-later"
}
