# Montainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-parallel-forkmanager
_lastauthor=Y/YA/YANICK
_pkgname=Parallel-ForkManager
pkgver=1.19
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
sha512sums=('fdd076de153a09e1e8fb681cadc6c36a05f4c8a6718df61937eb5d26729108a6f2f322a7fb9d4bf6166bbfe52cb857e3ea6cab8368c7b5959500018cc01747c6')

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
