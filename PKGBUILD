# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-x11-idletime
_lastauthor=A/AW/AWENDT
_pkgname=X11-IdleTime
pkgver=0.09
pkgrel=2
pkgdesc="Get the idle time of X11"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('libxss' 'perl-inline-c')
makedepends=('perl-extutils-makemaker')
url="http://search.cpan.org/dist/X11-IdleTime/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('d8fddc078e7981ee31b7608c653645cb20f016bdddc7c550b4d527efd3624748')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor" \
    PERL_MB_OPT="--installdirs vendor" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
