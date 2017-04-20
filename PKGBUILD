# Maintainer: 3ED <krzysztofas at protonmail dot com>
#
pkgname=perl-sah
_author=PERLANCAR
_pkgname=Sah
pkgver=0.9.45
pkgrel=1
pkgdesc='Schema for data structures'
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=('perl-defhash')
url="https://metacpan.org/release/${_pkgname}"

_lastauthor=${_author:0:1}/${_author:0:2}/${_author}
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('18b5e585f07ebba054469a15c852c99e18b63fbfd62c6edd13e1992738f0c9132d54f9c7c6e07d96b54494d3981019954dc3bf10801a09495c810bddc836a6a0')

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
