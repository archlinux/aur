# Montainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-eval-closure
_lastauthor=D/DO/DOY
_pkgname=Eval-Closure
pkgver=0.13
pkgrel=1
pkgdesc="safely and cleanly create closures via string eval"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-try-tiny' 'perl-sub-exporter')
checkdepends=('perl-test-requires' 'perl-test-fatal' 'perl-test-output')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('f87d8aa8af5f87611f95a8f1f44f9c403ab669f944b3a63a9f8ca6a80075ed957f0050bd57b2076581bc47fa57b710712ed9e3abe5670a1881b12dd674414f89')

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
