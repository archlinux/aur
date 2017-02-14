pkgname=perl-springgraph
pkgver=0.05
pkgrel=1
_author="T/TE/TEEJAY"
_perlmod="SpringGraph"
pkgdesc="SpringGraph - DESCRIPTION"
arch=('any')
url="http://search.cpan.org/dist/SpringGraph/"
license=('GPL' 'PerlArtistic')
depends=(perl)
makedepends=(perl-gd)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('9f5676e34ad93283493186c0209ec8f3ad0979bf8a04b1c4535534ba02c443d7')

prepare(){
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null
}
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
    ./Build install installdirs=vendor destdir="$pkgdir"
  fi

}

