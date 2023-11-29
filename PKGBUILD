# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=perl-array-diff
pkgver=0.09
pkgrel=2
_author="N/NE/NEILB"
_perlmod="Array-Diff"
pkgdesc="Array::Diff - Find the differences between two arrays"
arch=('any')
url='https://metacpan.org/pod/Array::Diff'
license=('GPL' 'PerlArtistic')
depends=(perl-algorithm-diff
perl-class-accessor-fast)
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
sha256sums=('8006392e9861e741537c2bbc9116c8e42b962f2e07e8d641a2ff6a11c6445077')

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

