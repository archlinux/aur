# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-app-perlall
pkgver=0.50
pkgrel=1
_author="R/RU/RURBAN"
_perlmod="App-perlall"
pkgdesc='App::perlall - Build, test and do with all perls'
arch=('any')
url="http://search.cpan.org/dist/App-perlall/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=(
perl-app-rad
perl-devel-platform-info
perl-devel-patchperl
perl-io-stringy
)
provides=(
perlall
perl-devel-patchperl-plugin-asan
perl-devel-patchperl-plugin-compiler
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('8717d0446c8619628959b807f7e112b44027ad457d7fbf167bf209d6d8fc5301')
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
