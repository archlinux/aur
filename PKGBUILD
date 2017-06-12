# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-test-mojibake
pkgver=1.3
pkgrel=1
_author="S/SY/SYP"
_perlmod="Test-Mojibake"
pkgdesc="Test::Mojibake - check your source for encoding misbehavior"
arch=('any')
url="http://search.cpan.org/dist/Test-Mojibake/"
license=('GPL' 'PerlArtistic')
depends=(perl)
checkdepends=()
makedepends=(perl-test-version perl-test-synopsis)
provides=()
conflicts=()
replaces=()
backup=()
install=
noextract=()
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
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

sha256sums=('8ffe75ff9b69352488727dca73db91f8aa14b59f2fa104eb7717c0d71a5f1b33')
