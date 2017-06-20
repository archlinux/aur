# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-ffi-checklib
pkgver=0.15
pkgrel=1
_author="P/PL/PLICEASE"
_perlmod="FFI-CheckLib"
pkgdesc="FFI-CheckLib - Check that a library is available for FFI"
arch=('any')
url="http://search.cpan.org/dist/FFI-CheckLib/"
license=('GPL' 'PerlArtistic')
depends=(perl)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('90da6c1c3b6171b5f68e2936fd2a80997fe519e21a0e8136f8f5e58c7ccc26ee')
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

