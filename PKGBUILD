# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-class-measure
pkgver=0.10
pkgrel=3
pkgdesc='Calculate, create, compare, and convert units of measurement. (via MetaCPAN distribution)'
_dist=Class-Measure
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-carp' 'perl-sub-exporter')
makedepends=('perl-module-build')
checkdepends=('perl-test2-suite')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/B/BL/BLUEFEET/$_dist-$pkgver.tar.gz")
sha256sums=(c0b79eb09a66cc41fb83aadbd24874372b465a74407b96e0722994eefbfd24ca)

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
