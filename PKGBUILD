# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-clone-pp
pkgver=1.07
pkgrel=1
_author=N/NE/NEILB
_perlmod=Clone-PP
pkgdesc='Clone::PP - Recursively copy Perl datatypes'
arch=('any')
url="http://search.cpan.org/dist/Clone-PP/"
license=('GPL' 'PerlArtistic')
groups=()
depends=(perl)
makedepends=()
provides=()
conflicts=()
replaces=()
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('bf85e109b7d9a10677db82fa65c1720ae95499a49cbb676d4b3d1b183786b395')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null
build(){
  cd "$srcdir"/$_perlmod-$pkgver

  if [ -r Makefile.PL ]; then
    /usr/bin/perl Makefile.PL
    make
  elif [ -r Build.PL ]; then
    perl Build.PL
    ./Build
  fi
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver

  if [ -r Makefile.PL ]; then
    make test
  elif [ -r Build.PL ]; then
    ./Build test
  fi
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver

  if [ -r Makefile.PL ]; then
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  elif [ -r Build.PL ]; then
    ./Build install --installdirs=vendor --destdir="$pkgdir"
  fi
}
