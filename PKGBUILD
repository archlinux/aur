# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-www-youtube-download
_lastauthor=O/OA/OALDERS
_pkgname=WWW-YouTube-Download
pkgver=0.57
pkgrel=1
pkgdesc="Very simple YouTube video download interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser' 'perl-json' 'perl-libwww' 'perl-uri' 'perl-xml-treepp')
makedepends=('perl-module-build-tiny')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('d7468c8ee784377ae856865e8b6c97f7932be34b7f62355f8b4ec03e5142c781')

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
