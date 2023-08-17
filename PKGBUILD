# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-xs-parse-keyword
pkgver=0.30
pkgrel=2
pkgdesc="XS functions to assist in parsing keyword syntax"
arch=('x86_64')
url="https://metacpan.org/dist/XS-Parse-Keyword"
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('perl-module-build' 'perl-extutils-cchecker')
checkdepends=('perl-test-pod')
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/XS-Parse-Keyword-${pkgver}.tar.gz")
sha512sums=('932e86ac3da9685ebf90a98e2d0909b32fdf994a6b84ff64cf3bbfd83572990b5193385fc22f1f4e1267b18a61ac768894f6aac1aea4f7510d98e1d332bed171')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/XS-Parse-Keyword-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  prepare_environment
  ./Build test
}

package() {
  prepare_environment
  ./Build install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}
