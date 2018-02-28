# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-test-reporter-transport-metabase
pkgver=1.999010
pkgrel=1
_author="D/DA/DAGOLDEN"
_perlmod="Test-Reporter-Transport-Metabase"
pkgdesc="Test::Reporter::Transport::Metabase - Metabase transport for Test::Reporter"
arch=('any')
url="http://search.cpan.org/dist/Test-Reporter-Transport-Metabase/"
license=('GPL' 'PerlArtistic')
depends=(
perl-cpan-testers-report
perl-json
perl-metabase-client-simple
perl-metabase-fact
perl-test-reporter
)
makedepends=(
perl-json
perl-cpan-testers-report
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('e9c6e60955cdb43e29b14687e867b80d40d717fbd70e2a2bb35396a5c8d7df89')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null

build(){
  cd "$srcdir"/$_perlmod-$pkgver

  if [ -r Makefile.PL ]; then
    /usr/bin/perl Makefile.PL
    make
  elif [ -r Build.PL ]; then
    /usr/bin/perl Build.PL
    perl Build
  fi
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver

  if [ -r Makefile.PL ]; then
    make test
  elif [ -r Build.PL ]; then
    perl Build test
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
