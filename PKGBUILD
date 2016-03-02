# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-defhash
_lastauthor=P/PE/PERLANCAR
_pkgname=DefHash
pkgver=1.0.11
pkgrel=1
pkgdesc='Define things according to a specification, using hashes'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('3e8f3c375e12f092750766eb983d5cd487769fc3324545d2cf83472c95c017d0762f0f72e216e33c559b0c822eb7e176993ed3beeecda5e49ead5a025797a67e')

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
