# Maintainer: éclairevoyant

_dist=Metrics-Any
pkgname='perl-metrics-any'
pkgver=0.09
pkgrel=1
pkgdesc="Abstract collection of monitoring metrics"
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.014')
makedepends=('perl-module-build')
checkdepends=('perl-test-fatal>=0')
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/$_dist-$pkgver.tar.gz")
b2sums=('b1b40c48d0a6d405f73f1a78dcab1e59c79c5195665ebef96b85531c39ab2f0cd90a495881a4b6e6cbcb114c0bf88479e8ce68310e72496a86f78a268962c50d')

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}
