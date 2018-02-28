# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

_author=D/DC/DCONWAY
_perlmod=Perl6-Perldoc
pkgname=perl-perl6-perldoc
pkgver=0.000013
pkgrel=1
pkgdesc='Perl6::Perldoc - Use Perl 6 documentation in a Perl 5 program'
arch=('any')
url="http://search.cpan.org/~dconway/Perl6-Perldoc/"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl
)
makedepends=(
perl
)
optdepends=()
provides=(
perl-perl6-perldoc-parser
perl-perl6-perldoc-to-text
perl-perl6-perldoc-to-xhtml
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('2e31a9830a2cfb5dd802a0fe52a640ed7c1b0356623c6478be54e21621bbdf7f')
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
