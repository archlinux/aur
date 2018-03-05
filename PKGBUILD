# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-archive-any-lite
pkgver=0.11
pkgrel=1
_author="I/IS/ISHIGAKI"
_perlmod="Archive-Any-Lite"
pkgdesc="Archive::Any::Lite - simple CPAN package extractor  "
arch=('any')
url="http://search.cpan.org/dist/Archive-Any-Lite/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
checkdepends=(perl-test-useallmodules)
makedepends=(perl-archive-zip perl-extutils-makemaker-cpanfile perl-module-cpanfile)
depends=(perl-archive-zip)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('15c188253993a4b66e5599f0789b1326f0a66c092bdbfac9313706d41c285170')
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
