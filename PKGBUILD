# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=perl-metabase-fact
pkgver=0.024
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

build(){
  cd "$srcdir"/$_perlmod-$pkgver
  
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  # If using Makefile.PL
  if [ -r Makefile.PL ]; then
    /usr/bin/perl Makefile.PL
    make
  # If using Build.PL
  elif [ -r Build.PL ]; then
    /usr/bin/perl Build.PL
    perl Build
  fi
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver

  # If using Makefile.PL
  if [ -r Makefile.PL ]; then
    make test
  # If using Build.PL
  elif [ -r Build.PL ]; then
    perl Build test
  fi
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver
  
  # If using Makefile.PL
  if [ -r Makefile.PL ]; then
    make install
  # If using Build.PL
  elif [ -r Build.PL ]; then
    perl Build install
  fi

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

sha256sums=('4aed9de5424cf5053858153cf2b7c0569687969355c9e87ed217a44c62fd8528')
