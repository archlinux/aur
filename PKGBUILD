# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='Compass-Points'
_projectauthor='JANUS'
pkgname="perl-${_projectname,,}"
pkgver='0.02'
pkgrel='3'
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
b2sums=('50b2acf7f923dffc99cb9c0f7feecd0b73b853e8e9451587692a2dbe60b4564017304eacf8431534edf832dfbd80f93236c53e10231450c9b8c6977a1e0c0f7e'
        '3549ac01bd8efa905c1b935b931b67bc2b7cb1286f8730a7481afae4a26518b24424dcb93620ae2e42e0c98033314c50a8799fe3f856d3b4f4f23dd55b4c42e5')

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
