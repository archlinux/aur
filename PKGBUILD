# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-metabase-client-simple
pkgver=0.012
pkgrel=1
_author="D/DA/DAGOLDEN"
_perlmod="Metabase-Client-Simple"
pkgdesc="Metabase::Client::Simple - a client that submits to Metabase servers"
arch=('any')
url="http://search.cpan.org/dist/Metabase-Client-Simple/"
license=('GPL' 'PerlArtistic')
depends=(
perl-http-message
perl-json
perl-libwww
perl-uri
)
makedepends=(
perl-metabase-fact
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
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
sha256sums=('b2b19441feb11b187bb71a8eba777a7d609e18f2bcdb85db6d73b655aed15520')
