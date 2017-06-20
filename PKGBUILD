# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-test-cchecker
pkgver=0.08
pkgrel=1
_author="P/PL/PLICEASE"
_perlmod="Test-CChecker"
pkgdesc="Test::CChecker - Test-time utilities for checking C headers, libraries, or OS features (DEPRECATED)"
arch=('any')
url="http://search.cpan.org/dist/Test-CChecker/"
license=('GPL' 'PerlArtistic')
makedepends=(perl-module-build)
checkdepends=(perl-extutils-cchecker)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('40cae51024f24854843408c118cdfb5fc1a69c96bf0ea41b5184c8306cfe59e0')
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

