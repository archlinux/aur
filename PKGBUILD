# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-defhash
_lastauthor=P/PE/PERLANCAR
_pkgname=DefHash
pkgver=1.0.10
pkgrel=1
pkgdesc='Define things according to a specification, using hashes'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('d10409cba34f522a8f2c5e4bdf881146c8ee6dff35d2536cdb2764f18533d2fcaa1d55a9b2b7b60e1050241a09d0a4ccca563e510573fad725876ad99e22416e')

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
