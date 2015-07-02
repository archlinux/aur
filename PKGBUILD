# Montainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-eval-closure
_lastauthor=D/DO/DOY
_pkgname=Eval-Closure
pkgver=0.12
pkgrel=1
pkgdesc="safely and cleanly create closures via string eval"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-try-tiny' 'perl-sub-exporter')
checkdepends=('perl-test-requires' 'perl-test-fatal' 'perl-test-output')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('070296c6cad3fc52adbc9827f707cd52ba14eef845d3acc91bd15e12aed8cbb5a9f4baf74500c1e31b9005a12436dc289b5f1191c959dea162043948517c82e2')

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
