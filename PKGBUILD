# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

_author=X/XM/XMATH
_perlmod=Data-Alias
pkgname=perl-data-alias
pkgver=1.25
pkgrel=2
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
sha512sums=('aa6b98fa5fb46a9f0b9281a2451a52cda151be8090b84c6c696d4e7bb9c42685ceb4dac69711026975c27ffac7b64eb489b512d6704c01cfe4f15b6e4189e286')
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
