# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-log-any-iflog
_lastauthor=P/PE/PERLANCAR
_pkgname=Log-Any-IfLOG
pkgver=0.07
pkgrel=1
pkgdesc='Load Log::Any only if "logging is enabled"'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-log-any')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('88ef7235b96a20c593118cd05f6db42a25bdb6a94802f356a904f263ba3cc444a9b5b246c843ab1a56c94cc98ba42a6c84e473efcb68c1c81dd2db7f3a29f04d')

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
