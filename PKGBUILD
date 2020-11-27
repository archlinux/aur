# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-menlo-legacy
_lastauthor=M/MI/MIYAGAWA
_pkgname=Menlo-Legacy
pkgver=1.9022
pkgrel=1
pkgdesc='Legacy internal and client support for Menlo'
arch=('any')
license=('PerlArtistic' 'GPL')
depends=(perl-menlo)
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('a6acac3fee318a804b439de54acbc7c27f0b44cfdad8551bbc9cd45986abc201')

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

