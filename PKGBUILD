# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-cairo-gobject
_lastauthor=X/XA/XAOC
_pkgname=Cairo-GObject
pkgver=1.004
pkgrel=2
pkgdesc="Integrate Cairo into the Glib type system"
arch=('i686' 'x86_64')
license=('LGPL')
options=('!emptydirs')
depends=('glib-perl' 'cairo-perl')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('3bb9d40e802e51f56f1364abc553758152131803c12d85ba6e14bad6813409d5')

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
