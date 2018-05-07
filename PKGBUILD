# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-test-script
pkgver=1.23
pkgrel=2
_author="P/PL/PLICEASE"
_perlmod="Test-Script"
url="http://search.cpan.org/dist/Test-Script"
pkgdesc="Test::Script - Basic cross-platform tests for scripts"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
perl-ipc-run3
perl-probe-perl
perl-capture-tiny
perl-test2-suite
)
makedepends=()
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('33a1e71b9797228c2124eea76831492ca9372e8f8075f3d8cded3ef818af44b1')
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
