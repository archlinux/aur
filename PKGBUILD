# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-sah
_lastauthor=P/PE/PERLANCAR
_pkgname=Sah
pkgver=0.9.39
pkgrel=1
pkgdesc='Schema for data structures'
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=('perl-defhash')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('7e8205d75874a59e714514f50a38994d4e9ebbe1104ec1a8eb50295c49e284bb540bda4867393c00bfbd3ef9c2007096139a0796d4900a49d1c2726dbd75d939')

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
