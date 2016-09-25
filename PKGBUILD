# Montainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-eval-closure
_lastauthor=D/DO/DOY
_pkgname=Eval-Closure
pkgver=0.14
pkgrel=1
pkgdesc="safely and cleanly create closures via string eval"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-try-tiny' 'perl-sub-exporter')
checkdepends=('perl-test-requires' 'perl-test-fatal' 'perl-test-output')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('fc55206bd39c4cb39360d06b6f39a65743f34b5e59d1a1ce99bf5831b9d88a03fb6dadf32fa9f0868e140fce719d53a7b13027f397cdd7f6ca05cc81277bdc08')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Makefile.PL
  make
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
}
