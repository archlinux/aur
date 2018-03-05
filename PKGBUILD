# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-archive-any
pkgver=0.0945
pkgrel=1
_author="O/OA/OALDERS"
_perlmod="Archive-Any"
pkgdesc="Archive::Any - Single interface to deal with file archives"
arch=('any')
url="http://search.cpan.org/dist/Perl-Archive-Any/"
license=('GPL' 'PerlArtistic')
depends=(
perl-archive-tar
perl-archive-zip
perl-module-find
perl-module-build
perl-file-mmagic
perl-mime-types
)
provides=(
perl-archive-any-plugin
perl-archive-any-plugin-tar
perl-archive-any-plugin-zip
perl-archive-any-tar
perl-archive-any-zip
)
checkdepends=(perl-test-warn)
makedepends=()
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('8c176cf649a7c3ef2cc2cc2d87eae79cfc0c13316cd4581404a99bc1a41a568f')
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
