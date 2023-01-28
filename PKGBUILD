# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

_author=X/XM/XMATH
_perlmod=Data-Alias
pkgname=perl-data-alias
pkgver=1.28
pkgrel=1
pkgdesc='Data::Alias - Comprehensive set of aliasing operations'
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Data-Alias/"
license=('GPL' 'PerlArtistic')
makedepends=(
perl-module-install
# perl-devel-callparser
)
depends=(perl)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha512sums=('7c42d0af8fdbbc67ee3a3c4f98b6a30f87778753fadfc3fac06f4f6c48123ca45c99fe148299db99cd3b9c342c6df1d4785193e5c08526ade8426543687f7f0f')
unset PERL5LIB PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 \
  PERL_AUTOINSTALL=--skipdeps \
  PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
  PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'"
  MODULEBUILDRC=/dev/null \

prepare(){
  cd $srcdir/$_perlmod-$pkgver
}
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
