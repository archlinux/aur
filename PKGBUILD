# Contributor: loserMcloser <reebydobalina@gmail.com>
pkgname=perl-xs-parse-sublike
pkgver=0.37
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
sha512sums=('3234cf389c4fa8ae207c94409b3912cb64855e6835688c8ee4ac9c1ad66e4aeee4be4e418332eac0eb281ee88efef8aaaf618e9b98b825e274c37954e7ccffa9')

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
