# Montainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-parallel-forkmanager
_lastauthor=Y/YA/YANICK
_pkgname=Parallel-ForkManager
pkgver=1.17
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
sha512sums=('2897cc737bc35ab88bd60fea1cd371a499ea32fdcc33095601ecf8930725dd6350041172dd138e4ee4a529641aacb6fa51ae34f7ac9f1359f910713f3afa0f2c')

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
