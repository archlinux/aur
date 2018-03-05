# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=perl-cpan-testers-report
pkgver=1.999003
pkgrel=1
_author="D/DA/DAGOLDEN"
_perlmod="CPAN-Testers-Report"
pkgdesc="CPAN::Testers::Report - CPAN Testers report object"
arch=('any')
url="http://search.cpan.org/dist/CPAN-Testers-Report/"
license=('GPL' 'PerlArtistic')
depends=(
perl-metabase-fact
)
makedepends=(
perl-metabase-fact
)
provides=(
perl-cpan-testers-fact-installedmodules
perl-cpan-testers-fact-legacyreport
perl-cpan-testers-fact-perlconfig
perl-cpan-testers-fact-prereqs
perl-cpan-testers-fact-testenvironment
perl-cpan-testers-fact-testoutput
perl-cpan-testers-fact-testsummary
perl-cpan-testers-fact-testercomment
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('26f5b7ac7113abfa76175f81060a4c47bd6c12e6bf0eed010f9b6c2487d0b676')
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
