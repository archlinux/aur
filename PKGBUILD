# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

_author=Z/ZE/ZEFRAM
_perlmod=Data-Alias
pkgname=perl-data-alias
pkgver=1.21
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
sha512sums=('19714402da3b0930c23407872d8122fb3f45a4d4a974a8afd4c4edf4d452748529619bfed3be592daa511f91e145084d177383937ef17dfc7c3a3b87512b5831')
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
