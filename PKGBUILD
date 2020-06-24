# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-www-youtube-download
_lastauthor=O/OA/OALDERS
_pkgname=WWW-YouTube-Download
pkgver=0.62
pkgrel=2
pkgdesc="Very simple YouTube video download interface (cli apps included)"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl-html-parser' 'perl-http-message' 'perl-json-maybexs' 'perl-libwww' 'perl-uri' 'perl-xml-treepp')
optdepends=('perl-json-xs: faster json parser')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('404218e80a51b31f61985689864cedb5f19238c381527c5aca7a264ee2ba21a7')

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
