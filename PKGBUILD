# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-xs-parse-keyword
pkgver=0.38
pkgrel=1
pkgdesc="XS functions to assist in parsing keyword syntax"
arch=('x86_64')
url="https://metacpan.org/dist/XS-Parse-Keyword"
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('perl-module-build' 'perl-extutils-cchecker')
checkdepends=('perl-test-pod')
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/XS-Parse-Keyword-${pkgver}.tar.gz")
sha512sums=('2b7dfade590c00095681a55ff937e3d9de1f939e0ea9fec6ae5cd06e618c2dacdc226f94047d41e6d95725dbf722feb3f2c8794a9a6950bfe12fc53bdbb823fa')

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
