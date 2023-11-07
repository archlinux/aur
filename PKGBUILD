pkgname=perl-data-guid
pkgver=0.051
pkgrel=1
_author="R/RJ/RJBS"
_perlmod="Data-GUID"
pkgdesc="Data::GUID - globally unique identifiers"
arch=('any')
url="https://metacpan.org/release/Data-GUID/"
license=('GPL' 'PerlArtistic')
depends=(
perl-data-uuid
perl-sub-exporter
perl-sub-install
)
makedepends=(
perl-data-uuid
perl-sub-exporter
perl-sub-install
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('68ea77c73fca891382f206e12449094501b6fbf2e57f54902d5064227cfd8e2e')
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
