# Maintainer: 3ED <krzysztofas at protonmail dot com>
#
pkgname=perl-b-lint
_author=RURBAN
_pkgname=B-Lint
pkgver=1.22
pkgrel=1
pkgdesc="perl linter"
arch=('any')
license=('PerlArtistic')
depends=('perl-module-pluggable')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"

options=('!emptydirs')
_lastauthor=${_author:0:1}/${_author:0:2}/${_author}
source=("https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('07e666030764d773469d2358ee75c372afad1893cdbee1074709bbf8a6189280')

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
