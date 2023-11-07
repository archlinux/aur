# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-text-hunspell
pkgver=2.16
pkgrel=1
_author=C/CO/COSIMO
_perlmod=Text-Hunspell
pkgdesc='Text::Hunspell - Perl interface to the GNU Hunspell library'
arch=('i686' 'x86_64')
url="https://metacpan.org/release/Text-Hunspell/"
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
sha256sums=('b796cd0ab197083301d8f44f5e21ee3e014b7a0791c9e10f3a51204029fd3a3b')
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
