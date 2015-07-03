# Montainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-parallel-forkmanager
_lastauthor=Y/YA/YANICK
_pkgname=Parallel-ForkManager
pkgver=1.14
pkgrel=1
pkgdesc="A simple parallel processing fork manager"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('49f1158ec4d52a1c9774af64f4e6d884dea3b4f1b0e550abe3e5eba31e7b3e64f5965838103dc5eb6ecb7713ff107199b60777e1a5fde667a1192401309c40a5')

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
