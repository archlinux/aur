# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-alien-base-modulebuild
pkgver=0.045
pkgrel=1
_author="P/PL/PLICEASE"
_perlmod="Alien-Base-ModuleBuild"
pkgdesc="Alien::Base::ModuleBuild - A Module::Build subclass for building Alien:: modules and their libraries"
arch=('any')
url="http://search.cpan.org/dist/Alien-Base-ModuleBuild/"
license=('GPL' 'PerlArtistic')
depends=(
perl-archive-extract
perl-shell-config-generate
perl-shell-guess
perl-module-build
)
checkdepends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
noextract=()
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('3588dee87ea8baac76d350bed758ea914a1660c372fba27dd015dc4be5098a11')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null
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
    ./Build install --installdirs=vendor --destdir="$pkgdir"
  fi
}

