# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-rinci
_lastauthor=P/PE/PERLANCAR
_pkgname=Rinci
pkgver=1.1.77
pkgrel=1
pkgdesc='Language-neutral metadata for your code entities'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-defhash' 'perl-sah')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('859555c9727cef72422d10f5cd4d9418dd8c1720859ed6df4d5d752105ee4f59d13e20539cdd629a3a36906968c66c9867800e9c2d61013a596ad736ca85ee05')

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
