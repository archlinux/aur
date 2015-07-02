# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-www-offliberty
_lastauthor=M/MG/MGV
_pkgname=WWW-Offliberty
pkgver=0.002
pkgrel=1
pkgdesc="a simple interface to the offliberty.com download service"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-tree' 'perl-libwww')
checkdepends=('perl-lwp-online')
makedepends=('perl-extutils-makemaker')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('c5fb22b8aca24c9fc1f42bfbe86f0afb7ee06aa3d08e46cd97761382c09be172')

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

