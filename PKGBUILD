# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-log-any-iflog
_lastauthor=P/PE/PERLANCAR
_pkgname=Log-Any-IfLOG
pkgver=0.090
pkgrel=1
pkgdesc='Load Log::Any only if "logging is enabled"'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-log-any')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('fcdc8e9de6a948a75bbae80e73e441b36b731be6b654fa739577a9112cfd8acb195af7f555a9a1dfa4c7422596f92c1ac32f414e20de66adc2480d17c7a38f80')

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
