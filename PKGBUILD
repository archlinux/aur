# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-cpan-common-index
_lastauthor=D/DA/DAGOLDEN
_pkgname=CPAN-Common-Index
pkgver=0.010
pkgrel=1
pkgdesc='Common library for searching CPAN modules, authors and distributions'
arch=('any')
license=('PerlArtistic' 'GPL')
depends=(perl-class-tiny perl-cpan-distnameinfo perl-tie-handle-offset)
url="https://metacpan.org/release/${_pkgname}/"
source=("https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c43ddbb22fd42b06118fe6357f53700fbd77f531ba3c427faafbf303cbf4eaf0')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl ./Makefile.PL
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

