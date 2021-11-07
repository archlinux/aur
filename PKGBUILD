# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-defhash
_lastauthor=P/PE/PERLANCAR
_pkgname=DefHash
pkgver=2.0.0
pkgrel=1
pkgdesc='Define things according to a specification, using hashes'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('29ad7acc7bb85ad269a7e8bc6822a9241c85a64490a88eda29164fd47a7c95d2494271b0721fc040b76f64dd8650b2814d47dd18f57cace4709058be9626c49c')

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
