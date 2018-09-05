# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-io-prompt-tiny
pkgver=0.003
pkgrel=1
_author="D/DA/DAGOLDEN"
_perlmod="IO-Prompt-Tiny"
pkgdesc="IO::Prompt::Tiny - Prompt for user input with a default option"
arch=('any')
url="http://search.cpan.org/dist/IO-Prompt-Tiny/"
license=('GPL' 'PerlArtistic')
depends=(
perl-capture-tiny
)
makedepends=(
perl-capture-tiny
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('00cc5a454f733367403dcdbba21966047f920c5abc5f03e6847d2f53e0c57996')
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
