# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-defhash
_lastauthor=P/PE/PERLANCAR
_pkgname=DefHash
pkgver=1.0.9
pkgrel=1
pkgdesc='Define things according to a specification, using hashes'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('4dc6981d92380ec455b092fa159cf379fc569f83694a8682d0442e745fdf1ae16a8428419e8a75195a57fc49a0bf449d1a3f0419a060b06953be5f65f9aa9f22')

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
