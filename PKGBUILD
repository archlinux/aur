pkgname=perl-configreader-simple
pkgver=1.295
_author=B/BD/BDFOY
_perlmod=ConfigReader-Simple
pkgrel=1
pkgdesc='ConfigReader::Simple - simple configuration file parser'
arch=('any')
url="https://metacpan.org/release/ConfigReader-Simple/"
license=('GPL' 'PerlArtistic')
depends=(perl-test-output)
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
sha256sums=('acb0d734b510722d26284b55c00d5dd214924bf2421351af41c37e171ef8eb90')
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
