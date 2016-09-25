# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-log-any-iflog
_lastauthor=P/PE/PERLANCAR
_pkgname=Log-Any-IfLOG
pkgver=0.08
pkgrel=1
pkgdesc='Load Log::Any only if "logging is enabled"'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-log-any')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('8e860c9a07c9026d3e0fb8792159fb18b517dc0b3ae6414b5451356688f13fe293963863a639c1d87bcb10f50b37bed558081552be981bf97c071b0f03f7844e')

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
