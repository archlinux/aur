# Contributor: loserMcloser <reebydobalina@gmail.com>
pkgname=perl-future
pkgver=0.50
pkgrel=2
pkgdesc='Perl module to represent an operation awaiting completion'
_dist=Future
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL')
depends=('perl')
makedepends=('perl-module-build')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/$_dist-$pkgver.tar.gz")
sha512sums=('d8c0011d0dcee9bb0317a394da34925d6a5e214ff8706158268d546f5b0e6d8fad7a8edafda2eada15bcca20d2da9ae722018c6dd0ff9a69bae1c0759776f616')

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
