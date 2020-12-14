# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-parse-pmfile
_lastauthor=I/IS/ISHIGAKI
_pkgname=Parse-PMFile
pkgver=0.43
pkgrel=1
pkgdesc='parses .pm file as PAUSE does'
arch=('any')
license=('PerlArtistic' 'GPL')
depends=(perl-json-pp)
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('be61e807204738cf0c52ed321551992fdc7fa8faa43ed43ff489d0c269900623')

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

