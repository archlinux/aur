# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-test-portability-files
pkgver=0.10
pkgrel=1
_author="A/AB/ABRAXXA"
_perlmod="Test-Portability-Files"
pkgdesc="Test-Portability-Files - Check file names portability"
arch=('any')
url="http://search.cpan.org/dist/Test-Portability-Files/"
license=('GPL' 'PerlArtistic')
depends=(perl)
checkdepends=(perl-test-mojibake)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('08e4b432492dc1b44b55d5db57952eb76379c7f434ee8f16aca64d491f401a16')
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
    ./Build install installdirs=vendor destdir="$pkgdir"
  fi
}

