# Maintainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-ppix-utilities
_lastauthor=E/EL/ELLIOTJS
_pkgname=PPIx-Utilities
pkgver=1.001000
pkgrel=3
pkgdesc="Extensions to PPI"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ppi' 'perl-readonly-xs' 'perl-exception-class')
checkdepends=('perl-test-deep')
makedepends=('perl-extutils-makemaker')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('03a483386fd6a2c808f09778d44db06b02c3140fb24ba4bf12f851f46d3bcb9b')

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
