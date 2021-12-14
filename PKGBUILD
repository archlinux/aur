# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

_author=S/SA/SALVA
_perlmod=Devel-SmallProf
pkgname=perl-devel-smallprof
pkgver=2.02
pkgrel=4
pkgdesc="Devel::SmallProf - Per-line Perl profiler"
arch=('any')
url="https://search.cpan.org/dist/Devel-SmallProf/"
license=('GPL' 'PerlArtistic')
depends=(perl)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('8cd514166c66c44ffbe2d0728583032d602b5786ef3a0b7e575f733cc5bd8b08')
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
