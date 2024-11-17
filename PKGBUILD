# Contributor: loserMcloser <reebydobalina@gmail.com>
pkgname=perl-future
pkgver=0.51
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
sha512sums=('d87f565b78c09309d6931b967e7872762b5efe96d7759d8db655d85e4738962de53dc1993ee735176256de23ce0b6e38308dc84180c5659fb173aa5f9a7e7be3')

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
