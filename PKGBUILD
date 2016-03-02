# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-rinci
_lastauthor=P/PE/PERLANCAR
_pkgname=Rinci
pkgver=1.1.79
pkgrel=1
pkgdesc='Language-neutral metadata for your code entities'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-defhash' 'perl-sah')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('6e9379cb65ec0445acbd2f1e8a96b9f0db8dfc940f8a33d3ee739fc5a99127feba6cc4138f2fa8d46d9d485b2333618bf0a60bb7e7ef4b77e8fa6900b0ed871e')

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
