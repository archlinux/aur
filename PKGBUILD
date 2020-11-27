# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-sys-filesystem
_lastauthor=R/RE/REHSACK
_pkgname=Sys-Filesystem
pkgver=1.408
pkgrel=1
pkgdesc='Retrieve list of filesystems and their properties'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-pluggable' 'perl-params-util')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('577e11072b897d718c234181a5c059f8dc04b65fd95465f0b1292cb635974d97')

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

