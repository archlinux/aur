# Montainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-parallel-forkmanager
_lastauthor=Y/YA/YANICK
_pkgname=Parallel-ForkManager
pkgver=1.18
pkgrel=1
pkgdesc="A simple parallel processing fork manager"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-warn')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('1d9f959f0caee374273c6eacd0791d758f899aa4a2fd5040232df82c170ba57de396608ce7f464412f00260ca14fb6e9302c6f4eab48419c6b445e86ae43366c')

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
