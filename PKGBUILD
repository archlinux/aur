# Montainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-subtitles
_lastauthor=K/KA/KARASIK
_pkgname=Subtitles
pkgver=1.04
pkgrel=1
pkgdesc="convert, join, split, and re-time subtitles"
arch=('any')
license=()
options=('!emptydirs')
depends=('perl')
makedepends=('perl-extutils-makemaker')
checkdepends=()
optdepends=('perl-prima: for subplay')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('2bd670a0d2d61e76ede1f2c8f4b219e53b07cc28a08d67dfb5b20e54a1b6b0338ab284800fbf8c436cb5e038b47d120690f3ecd7edecf0b6749ece8fa790e8a2')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

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
