# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-b-c
_lastauthor=R/RU/RURBAN
_pkgname=B-C
pkgver=1.54
pkgrel=1
pkgdesc="Perl compiler's C backend"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ipc-run' 'perl-opcodes' 'perl-b-flags' 'perl-time-hires')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('d07e5af5fb798fcd3f4eda5e40744a14c1b3ef9e585a7dca55b5db31cb1d28d3')

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
