# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

_author=D/DC/DCONWAY
_perlmod=Perl6-Export
pkgname=perl-perl6-export
pkgver=0.009
pkgrel=1
pkgdesc="Perl6::Export - Implements the Perl 6 'is export(...)' trait "
arch=('any')
url="http://search.cpan.org/~dconway/Perl6-Export/"
license=('GPL' 'PerlArtistic')
groups=('perl6')
depends=('perl')
makedepends=('perl')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('8eff1d7f4403cc3a6726b8541b6e9f62427efbd16e4058e59bfbbd1396d99576')
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
