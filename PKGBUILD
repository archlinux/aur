# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-metabase-fact
pkgver=0.025
pkgrel=1
_author="D/DA/DAGOLDEN"
_perlmod="Metabase-Fact"
pkgdesc="Metabase::Fact - base class for Metabase Fact"
arch=('any')
url="http://search.cpan.org/dist/Metabase-Fact/"
license=('GPL' 'PerlArtistic')
depends=(
perl-data-guid
perl-io-prompt-tiny
perl-cpan-distnameinfo
perl-json
)
checkdepends=(
perl-test-exception
)
makedepends=(
perl-data-guid
perl-io-prompt-tiny
perl-cpan-distnameinfo
perl-json
)
provides=(
perl-metabase-fact-hash
perl-metabase-fact-string
perl-metabase-report
perl-metabase-resource
perl-metabase-resource-cpan
perl-metabase-resource-cpan-distfile
perl-metabase-resource-metabase
perl-metabase-resource-metabase-fact
perl-metabase-resource-metabase-user
perl-metabase-resource-perl
perl-metabase-resource-perl-commit
perl-metabase-user-emailaddress
perl-metabase-user-fullname
perl-metabase-user-profile
perl-metabase-user-secret 
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('dc19950ed8c3199a7a89f0c5f06bf682443d5d3d2c0d7a683a63f488a5100c71')
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
