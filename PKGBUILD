# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-x11-aosd
_lastauthor=J/JR/JRED
_pkgname=X11-Aosd
pkgver=0.03
pkgrel=6
pkgdesc="libaosd binding for Cairo powered on screen display"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('libaosd' 'gtk2-perl' 'perl-extutils-depends' 'perl-extutils-pkgconfig')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}/"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('7cbf1d75704d5a7104f8fd3c5369a2ed70b73758fd8a2715813366625c902e33')

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
