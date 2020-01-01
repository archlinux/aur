# Maintainer: 3ED <krzysztofas at protonmail dot com>
#
pkgname=perl-rinci
_author=PERLANCAR
_pkgname=Rinci
pkgver=1.1.93
pkgrel=1
pkgdesc='Language-neutral metadata for your code entities'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-defhash' 'perl-sah')
url="https://metacpan.org/release/${_pkgname}"

_lastauthor=${_author:0:1}/${_author:0:2}/${_author}
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('67b61dc163710224d6beee560abea7156f8a28bac838410f076d4432eeda3dcb47c438e34412d4111e93cd39f941a422c37798632b227eaad756e88bfe11314b')

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
