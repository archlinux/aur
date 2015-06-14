# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=perl-configreader-simple
pkgver=1.28
_author=B/BD/BDFOY
_perlmod=ConfigReader-Simple
pkgrel=3
pkgdesc='ConfigReader::Simple - simple configuration file parser'
arch=('any')
url="http://search.cpan.org/dist/ConfigReader-Simple/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl>=5.10.0')
makedepends=()
#optdepends=(
#  'perl-test-output: for testing packages'
#  'perl-test-warn: for testing packages'
#  'perl-test-prereq: for testing packages'
#)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
noextract=()

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
md5sums=('2b6b97fdc4c2082c15d9c4c0300747cb')
