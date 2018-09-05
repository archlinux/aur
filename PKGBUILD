# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

_author=D/DO/DOMM
_perlmod=Module-ExtractUse
pkgname=perl-module-extractuse
pkgver=0.342
pkgrel='1'
pkgdesc="Module::ExtractUse - Find out what modules are used"
arch=('any')
url='http://search.cpan.org/dist/Module-ExtractUse'
license=('PerlArtistic' 'GPL')
depends=(
perl-parse-recdescent
perl-pod-strip
perl-test-deep
perl-test-nowarnings
perl-test-pod
perl-test-pod-coverage
perl-universal-require
)
provides=(
perl-module-extractuse-grammar
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha512sums=('aed259d7b777ed44ef029b8b79d5b6fb4c9f7be046f471637cfe7850912bd38ca85115a06cb6a5ed63decbf08d0c4fa1e65d2de25cf39ca62442f9e05a079eaf')
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
