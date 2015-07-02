# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-time-out
_lastauthor=P/PA/PATL
_pkgname=Time-Out
pkgver=0.11
pkgrel=1
pkgdesc='Easily timeout long running operations'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('707f113bf3d6c607f8e945d0bd89e9b035eebd7df79e3d8f62eea9e344bebfdce7d9165bfaf20c6267e68e3503c673077cec0823a7b2f139c24effd2e6cecd0a')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd ${_pkgname}-${pkgver}
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

