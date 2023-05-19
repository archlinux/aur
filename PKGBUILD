# Maintainer: éclairevoyant

_dist=Future-IO
pkgname=perl-future-io
pkgver=0.14
pkgrel=1
pkgdesc="Future-returning IO methods"
arch=(any)
license=(GPL PerlArtistic)
options=('!emptydirs')
depends=('perl>=5.010' perl-future perl-struct-dumb)
makedepends=(perl-module-build)
checkdepends=(perl-test2-suite perl-test-future-io-impl)
url="https://metacpan.org/release/$_dist"
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/$_dist-$pkgver.tar.gz")
b2sums=('562e10a67bd45cb7d36471eee2d31a8cfa5e873fe73a4e4876da377f7eaf161fb55fcd4b60f1725632cb8898591e7559704c737c38ad1754209fc5cbb42f597b')

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
