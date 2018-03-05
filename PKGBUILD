# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

_author=T/TH/THALJEF
_perlmod=Perl-Critic-More
pkgname=perl-critic-more
pkgver=1.003
pkgrel=2
pkgdesc='Perl::Critic::More - Supplemental policies for Perl::Critic'
arch=('any')
url="http://search.cpan.org/dist/Perl-Critic-More/"
license=('GPL' 'PerlArtistic')
depends=(
perl
)
makedepends=()
provides=(
perl-perl-critic-policy-codelayout-requireascii
perl-perl-critic-policy-editor-requireemacsfilevariables
perl-perl-critic-policy-errorhandling-requireuseofexceptions
perl-perl-critic-policy-modules-perlminimumversion
perl-perl-critic-policy-modules-requireperlversion
perl-perl-critic-policy-valuesandexpressions-requireconstantonleftsideofequality
perl-perl-critic-policy-valuesandexpressions-restrictlongstrings
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('69e2acff61b7bead745721991e2b83c88624ae8239d4371a785a3ce2d967187b')
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
