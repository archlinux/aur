# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-parse-exuberantctags
pkgver=1.02
pkgrel=2
_author="S/SM/SMUELLER"
_perlmod="Parse-ExuberantCTags"
pkgdesc="Parse::ExuberantCTags - Efficiently parse exuberant ctags files"
arch=(i686 x86_64)
url="http://search.cpan.org/dist/Parse-ExuberantCTags/"
license=('GPL' 'PerlArtistic')
depends=(perl)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
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

  if [ -r Makefile.PL ]; then
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
sha256sums=('78d5a2b384a7d4a2dd674b0c0b79dc55d46017ba2a21d35d8d4858a025d5ca6c')
