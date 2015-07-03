# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-class-load-xs
_lastauthor=E/ET/ETHER
_pkgname=Class-Load-XS
pkgver=0.09
pkgrel=3
pkgdesc="XS implementation of parts of Class::Load"
arch=('i686' 'x86_64')
license=('PerlArtistic2')
options=('!emptydirs')
# https://bugs.archlinux.org/task/43204
# perl-class-load should depend on perl-namespace-clean
depends=('perl-class-load' 'perl-namespace-clean')
checkdepends=('perl-module-implementation' 'perl-test-fatal' 'perl-test-requires')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('9b24637cf7b035ba369f05e42c0bd5a8590e001f2395b46df078635a50bb3df58ad57850be0010d092ae2530d9a545bbcc5f0055f6ae7f166c93905c022d469d')

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
