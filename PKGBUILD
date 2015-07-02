# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-sys-filesystem
_lastauthor=R/RE/REHSACK
_pkgname=Sys-Filesystem
pkgver=1.406
pkgrel=1
pkgdesc='Retrieve list of filesystems and their properties'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-pluggable' 'perl-params-util')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('9a1d43326226f8aea3359849383784840ef930e5c4efafa4cbd5764d2c7a6afb')

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

