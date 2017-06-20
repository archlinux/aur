# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-alien-base
pkgver=0.042
pkgrel=1
_author="P/PL/PLICEASE"
_perlmod="Alien-Base"
pkgdesc="Alien::Base - Base classes for Alien:: modules"
arch=('any')
url="http://search.cpan.org/dist/Alien-Base/"
license=('GPL' 'PerlArtistic')
depends=(
perl-ffi-checklib
perl-test2-suite
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('0a058d9315bf83a24aade3d56bd59613bc28b6092e16d29c028ffd02751516f6')
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

