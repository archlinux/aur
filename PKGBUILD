# Contributor: loserMcloser <reebydobalina@gmail.com>
pkgname=perl-xs-parse-sublike
pkgver=0.30
pkgrel=1
pkgdesc='XS functions to assist in parsing C<sub>-like syntax'
_dist=XS-Parse-Sublike
arch=('x86_64' 'i686')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-file-sharedir')
makedepends=('perl-module-build')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/$_dist-$pkgver.tar.gz")
sha512sums=('4b17d5fcf79b84f092a5c81b89f5c45d614e8a4b4316a21d0e517146bc6962dd2b5c548ffbae8f75ea5b9ea09079104f28adf7a5e209558675de5dce7ff09bdf')

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
