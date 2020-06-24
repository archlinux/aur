# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-test-taint
_lastauthor=P/PE/PETDANCE
_pkgname=Test-Taint
pkgver=1.08
pkgrel=2
pkgdesc="Tools to test taintedness"
arch=('i686' 'x86_64')
license=('PerlArtistic2')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('5d594d4257352c93785024c63aa0a7b73d912ceca9611cd975ce83aab021a97d')

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
