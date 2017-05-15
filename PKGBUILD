# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=perl-devel-checkbin
pkgver=0.02
pkgrel=1
pkgdesc='perl module that checks whether a particular command is available'
_dist=Devel-CheckBin
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl)
makedepends=('perl-module-build')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOKUHIROM/$_dist-$pkgver.tar.gz")
sha512sums=('ba99b0e8177e284258caed44ec426b9eebc2afd621568d65617bd167f6a90662624ce43f083e3c4edffd1404da92220841a65b3de554a0fcaa47de53770d5d79')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}
