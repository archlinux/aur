# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

_author=B/BP/BPS
_perlmod=Test-Expect
pkgname=perl-test-expect
pkgver=0.34
pkgrel=1
pkgdesc='Test::Expect - Automated driving and testing of terminal-based programs'
arch=('any')
url='http://search.cpan.org/dist/Test-Expect/'
license=('GPL' 'PerlArtistic')
depends=(
perl
perl-expect-simple
perl-class-accessor-chained
)
makedepends=(perl-expect)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('2628fcecdda5f649bd25323f646b96a1a07e4557cadcb327c9bad4dc41bbb999')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null

build(){
  cd "$srcdir"/$_perlmod-$pkgver

  if [ -f Makefile.PL ]; then
    perl Makefile.PL
    make
  else
    perl Build.PL
    ./Build
  fi
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver

  if [ -f Makefile.PL ]; then
    make test
  else
    ./Build test
  fi
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver

  if [ -f Makefile.PL ]; then
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  else
    ./Build install --installdirs=vendor --destdir="$pkgdir"
  fi
}
