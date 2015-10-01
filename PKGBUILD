# Montainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-parallel-forkmanager
_lastauthor=Y/YA/YANICK
_pkgname=Parallel-ForkManager
pkgver=1.15
pkgrel=1
pkgdesc="A simple parallel processing fork manager"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('8bb79c4cef31abe22d037b23080352932ca419a0ff05f03e80631fbfa0d618f542a9658427ae423a78d0f109f15336cd25bacbbc5fe066623bd0fdd665e7176a')

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
