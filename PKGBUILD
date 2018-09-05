# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=perl-pod-coverage-trustpod
pkgver=0.100005
pkgrel=1
_author='R/RJ/RJBS'
_perlmod='Pod-Coverage-TrustPod'
pkgdesc="Pod::Coverage::TrustPod - allow a module's pod to contain Pod::Coverage hints"
arch=('any')
url="http://search.cpan.org/dist/Pod-Coverage-TrustPod/"
license=('GPL' 'PerlArtistic')
depends=(
perl-pod-eventual
perl-pod-coverage
)
provides=()
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('6c68835c24cdcafbb1567e680ab12bb17616382baf8bc44ce457e41a1d357321')
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
