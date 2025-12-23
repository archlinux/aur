# Contributor: loserMcloser <reebydobalina@gmail.com>
pkgname=perl-future
pkgver=0.52
pkgrel=1
pkgdesc='Perl module to represent an operation awaiting completion'
_dist=Future
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL')
depends=('perl')
makedepends=('perl-module-build')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/$_dist-$pkgver.tar.gz")
sha512sums=('625d7c4cf967d9975851bbb2c4293be01bf70644ea7f21e168e1cb3622d3f5549cea67dda1df820e13898683874dea60cce979d65cd5e6aca69d96f3d0d91950')

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
