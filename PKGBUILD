# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-test-alien-cpp
pkgver=1.03
pkgrel=1
_author="P/PL/PLICEASE"
_perlmod="Test-Alien-CPP"
pkgdesc="Test::Alien::CPP - Testing tools for Alien modules for projects that use C++"
arch=('any')
url="http://search.cpan.org/dist/test-alien-cpp/"
license=('GPL' 'PerlArtistic')
depends=(perl)
checkdepends=()
makedepends=(
perl-test2-suite
perl-extutils-cppguess
perl-alien-build
)
provides=()
conflicts=()
replaces=()
backup=()
install=
noextract=()
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('47936e7c12d7f4869f7112783576c6be7b822180114850008253c3eedc341898')
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

