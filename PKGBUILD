# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-sah
_lastauthor=P/PE/PERLANCAR
_pkgname=Sah
pkgver=0.9.37
pkgrel=1
pkgdesc='Schema for data structures'
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=('perl-defhash')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('210a3fc87710b084eb9e570a885c203aaeb9417946689aa0612d7d3279d7c06dd1d0c8442ed68729ffe5e336e709d70cd36db6c8bb6ecc1ba651a4622b633050')

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
