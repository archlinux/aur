# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

_distname='Template-Plugin-JSON'
pkgname='perl-template-plugin-json'
pkgver='0.08'
pkgrel='1'
pkgdesc="Adds a .json vmethod for all TT values."
arch=('any')
license=('MIT')
options=('!emptydirs')
depends=(
  'perl'
  'perl-json-maybexs'
  'perl-moose'
  'perl-template-toolkit'
)
checkdepends=(
  'perl-sub-name'
  'perl-yaml'
)
url="https://metacpan.org/release/$_distname"
_author='ETHER'
source=("https://search.cpan.org/CPAN/authors/id/${_author::1}/${_author::2}/$_author/$_distname-$pkgver.tar.gz")
sha512sums=('98cdabbbab4781b8c811a0ad4ae6b26f9fbeeb1fcb8d8529b07ce92e8eb617920620721a9b01c3e91bedb60b609c8e04f82ef304a302d6b4a2287a1617e2a5fb')
_distdir="$_distname-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete

  install -Dm644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
