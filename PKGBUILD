# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-http-tinyish
_lastauthor=M/MI/MIYAGAWA
_pkgname=HTTP-Tinyish
pkgver=0.17
pkgrel=1
pkgdesc='HTTP::Tiny compatible HTTP client wrappers'
arch=('any')
license=('PerlArtistic' 'GPL')
depends=(perl-file-which perl-ipc-run3)
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('47bd111e474566d733c41870e2374c81689db5e0b5a43adc48adb665d89fb067')

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

