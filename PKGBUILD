# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-alien-hunspell
pkgver=0.11
pkgrel=1
_author="P/PL/PLICEASE"
_perlmod="Alien-Hunspell"
pkgdesc="Alien::Hunspell - Install hunspell"
arch=('any')
url="http://search.cpan.org/dist/Alien-Hunspell/"
license=('GPL' 'PerlArtistic')
depends=(
perl-alien-build
perl-ffi-checklib
)
checkdepends=(perl-test-cchecker)
makedepends=(perl-module-build)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('8a8c7e7c54ce5fe40c7ca888361f1b2d720f2e8014257f91e44d10ed5b9bfeb9')
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

