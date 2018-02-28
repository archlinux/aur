# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-test-reporter
pkgver=1.62
pkgrel=1
_author="D/DA/DAGOLDEN"
_perlmod="Test-Reporter"
pkgdesc="Test::Reporter - sends test results to cpan-testers@perl.org"
arch=('any')
url="http://search.cpan.org/dist/Test-Reporter/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=(perl)
provides=(
perl-test-reporter-transport
perl-test-reporter-transport-file
perl-test-reporter-transport-null
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('110064e0560a0f631f9c34444486ab628a0f21d6fa623eb4fbed062219aa163b')
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
