# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-defhash
_lastauthor=P/PE/PERLANCAR
_pkgname=DefHash
pkgver=1.0.12
pkgrel=1
pkgdesc='Define things according to a specification, using hashes'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('ff67f9a955ce354ffe4d5f102b0bb6b2c760dc199d51b73ba1ddf125baa2fdbecac469ca0110e3e9d4fff14ef693c0757d6d75406ee601a299f2c4bab7430cbf')

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
