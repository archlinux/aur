# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-text-hunspell
pkgver=2.14
pkgrel=1
_author=C/CO/COSIMO
_perlmod=Text-Hunspell
pkgdesc='Text::Hunspell - Perl interface to the GNU Hunspell library'
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Text-Hunspell/"
license=('GPL' 'PerlArtistic')
depends=(
hunspell
)
makedepends=(
hunspell
perl-extutils-pkgconfig
perl-alien-hunspell
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('22e1000b566b8a3d34fdb2f8afa8130e2fc28e81773c5b67dfd020ef41c53406')
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
