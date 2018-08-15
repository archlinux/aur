# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-www-youtube-download
_lastauthor=O/OA/OALDERS
_pkgname=WWW-YouTube-Download
pkgver=0.60
pkgrel=1
pkgdesc="Very simple YouTube video download interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser' 'perl-json' 'perl-libwww' 'perl-uri' 'perl-xml-treepp')
makedepends=('perl-module-build-tiny')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('fe77a5efd4e9c68971a104a09efa4c6a45ef4f71cddb4c49c4a00926f7f70a86')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build.PL
  perl Build
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build install
}
