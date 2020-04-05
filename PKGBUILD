# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Hash-SharedMem'
_modnamespace=Hash
pkgname=perl-hash-sharedmem
pkgver=0.005
pkgrel=1
pkgdesc="efficient shared mutable hash"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl')
makedepends=('perl-data-dumper' 'perl-devel-callchecker' 'perl-extutils-cbuilder' 'perl-extutils-parsexs' 'perl-module-build' 'perl-scalar-string' 'perl-test-simple')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('324776808602f7bdc44adaa937895365454029a926fa611f321c9bf6b940bb5e')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

  perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

  ./Build test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

  ./Build install --installdirs=vendor --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
