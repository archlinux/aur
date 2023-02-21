# Maintainer: éclairevoyant

_dist=Future-IO
pkgname=perl-future-io
pkgver=0.13
pkgrel=1
pkgdesc="Future-returning IO methods"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-future' 'perl-struct-dumb' 'perl>=5.010')
makedepends=('perl-module-build')
checkdepends=('perl-test2-suite')
url="https://metacpan.org/release/$_dist"
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/$_dist-$pkgver.tar.gz")
b2sums=('f165fab97da297a0202e8a323bc731438957d248270e4a95ad9374b770c18a287aaa7aef2bb27948832ffde5b14dbde5e0c9fbb3d81225c473bfa8c6637e6557')

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
