# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-cpan-reporter
pkgver=1.2019
_author=D/DA/DAGOLDEN
_author=G/GA/GARU
_perlmod=CPAN-Reporter
pkgrel=1
pkgdesc='CPAN::Reporter - Adds CPAN Testers reporting to CPAN.pm'
arch=('any')
url="https://metacpan.org/dist/CPAN-Reporter/"
license=('GPL' 'PerlArtistic')
depends=(
perl-capture-tiny
perl-config-tiny
perl-devel-autoflush
perl-test-reporter
)
makedepends=(
perl-capture-tiny
perl-config-tiny
perl-devel-autoflush
perl-test-reporter
perl-probe-perl
)
checkdepends=(
perl-file-copy-recursive
perl-file-pushd
perl-io-captureoutput
)
provides=(
perl-cpan-reporter-api
perl-cpan-reporter-config
perl-cpan-reporter-faq
perl-cpan-reporter-history
perl-cpan-reporter-prereqcheck
)
optdepends=('perl-test-reporter-transport-metabase: Metabase transport')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('8b0bad08c6ad9dbcbb4681eba1082af845d4fe897ae97c06187889832322b60b')
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
