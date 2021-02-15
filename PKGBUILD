# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

_author=B/BR/BRICKER
_perlmod=Config-Std
pkgname=perl-config-std
pkgver=0.903
pkgrel=1
pkgdesc="Config::Std - Load and save configuration files in a standard format"
arch=('any')
url="https://metacpan.org/release/Config-Std"
license=('GPL' 'PerlArtistic')
depends=(perl-class-std)
makedepends=(perl-class-std)
provides=(
perl-config-std-block
perl-config-std-comment
perl-config-std-gap
perl-config-std-hash
perl-config-std-keyval
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('b7709ff663bd279d264ab9c2f51e9e9588479a3367a8c4cfc18659c2a11480fe')
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
  # https://rt.cpan.org/Public/Bug/Display.html?id=85956
#  return 0
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
