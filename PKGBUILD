# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-alien-hunspell
pkgver=0.08
pkgrel=1
_author="P/PL/PLICEASE"
_perlmod="Alien-Hunspell"
pkgdesc="Alien::Hunspell - Install hunspell"
arch=('any')
url="http://search.cpan.org/dist/Alien-Hunspell/"
license=('GPL' 'PerlArtistic')
depends=(
perl-alien-base
perl-ffi-checklib
)
checkdepends=(perl-test-cchecker)
makedepends=(perl-module-build)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('c23d0870ba8ce4f2ab0af0093ee29ed9fa23f14b3c21fa05e9996cddb54326ca')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null
build(){
  cd "$srcdir"/$_perlmod-$pkgver

  if [ -f Makefile.PL ]; then
    /usr/bin/perl Makefile.PL
    make
  else
    /usr/bin/perl Build.PL
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

