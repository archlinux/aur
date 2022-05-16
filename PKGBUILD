# Maintainer: 3ED <krzysztofas at protonmail dot com>
#
pkgname=perl-rinci
_author=PERLANCAR
_pkgname=Rinci
pkgver=1.1.102
pkgrel=1
pkgdesc='Language-neutral metadata for your code entities'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-defhash' 'perl-sah')
url="https://metacpan.org/release/${_pkgname}"

_lastauthor=${_author:0:1}/${_author:0:2}/${_author}
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('c78a0d12c64187131b73c554b65d58490e53fcf07404a6a89ed32323acfe6d10e64c31edc7bf13e0ea7c0c34ecd01a51bf67bb9d5b390b95cfdbea2e58c956d0')

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
