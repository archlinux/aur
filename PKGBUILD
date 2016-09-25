# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-www-offliberty
_lastauthor=M/MG/MGV
_pkgname=WWW-Offliberty
pkgver=1.000003
pkgrel=1
pkgdesc="a simple interface to the offliberty.com download service"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-tree')
checkdepends=('perl-test-requiresinternet')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('9719bd5349a62be238cb0ba3ad05d32fc9747edf509fae0dfb6e31fe647c05b0')

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
  cd ${_pkgname}-${pkgver}
  make test
}
package() {
  cd ${_pkgname}-${pkgver}
  make install
}

