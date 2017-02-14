pkgname=perl-vcg
pkgver=0.5
pkgrel=1
_author="T/TE/TEEJAY"
_perlmod="VCG"
pkgdesc="Interface to the VCG graphing tool"
arch=('any')
url="http://search.cpan.org/dist/VCG/"
license=('GPL' 'PerlArtistic')
depends=(perl)
makedepends=(perl-ipc-run)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('c5095c203744e2b73ba15e24a3a4daef9a5c08f0ef92dcdaf80e9c961f1082bf')
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
