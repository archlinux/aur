# Contributor: loserMcloser <reebydobalina@gmail.com>
pkgname=perl-xs-parse-sublike
pkgver=0.23
pkgrel=1
pkgdesc='XS functions to assist in parsing C<sub>-like syntax'
_dist=XS-Parse-Sublike
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-file-sharedir')
makedepends=('perl-module-build')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/$_dist-$pkgver.tar.gz")
sha512sums=('094fcd3e67dc44176a995aad8ea5a67d4b6dde73f546636654f1d2c425f0f0bfc8a0053b134022a936660daf4fb5976c08ed665d04690036b062d7cacba28814')

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
