# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-test-taint
_lastauthor=P/PE/PETDANCE
_pkgname=Test-Taint
pkgver=1.06
pkgrel=3
pkgdesc="Tools to test taintedness"
arch=('i686' 'x86_64')
license=('PerlArtistic2')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('721b51ca91d248ea5ff4f99ca49c05a080e6f0fc9f7983e96121b7775ab93107')

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
