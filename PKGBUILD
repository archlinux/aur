# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-xml-xbel
_lastauthor=A/AS/ASCOPE
_pkgname=XML-XBEL
pkgver=1.4
pkgrel=3
pkgdesc="OOP for reading and writing XBEL documents"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-libxml' 'perl-timedate')
makedepends=('perl-module-build')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('94c489f49fdb561fc96d9f76f9cf40892f44831628bfbc86b916bbe0ed356a89')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build.PL
  perl Build
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build install
}
