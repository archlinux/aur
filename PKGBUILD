# Maintainer: 3ED <krzysztofas at protonmail dot com>
#
pkgname=perl-sah
_author=PERLANCAR
_pkgname=Sah
pkgver=0.9.50
pkgrel=1
pkgdesc='Schema for data structures'
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=('perl-defhash')
url="https://metacpan.org/release/${_pkgname}"

_lastauthor=${_author:0:1}/${_author:0:2}/${_author}
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('7b031ff0fc5ad190aa60a67e6f160b3c314f600e3f78ae64a648d40af8d9b3f2f3df7d341274918937dfb814f9b5b904f1daccd8e5af7d4b3edf661eb58cebb8')

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
