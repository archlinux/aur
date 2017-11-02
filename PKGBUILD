# Maintainer: 3ED <krzysztofas at protonmail dot com>
#
pkgname=perl-www-offliberty
_author=MGV
_pkgname=WWW-Offliberty
pkgver=1.000007
pkgrel=1
pkgdesc="a simple interface to the offliberty.com download service"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-tree')
checkdepends=('perl-test-requiresinternet')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"

_lastauthor=${_author:0:1}/${_author:0:2}/${_author}
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('2edbe1fc2fb15f78abbe866b6009f83b3716f8233ddbbcf9a8fd8accd7ddccbe')

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

