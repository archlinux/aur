# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-parallel-pipes
_lastauthor=S/SK/SKAJI
_pkgname=Parallel-Pipes
pkgver=0.005
pkgrel=1
pkgdesc='parallel processing using pipe(2) for communication and synchronization'
arch=('any')
license=('PerlArtistic' 'GPL')
depends=(perl)
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('44bd9e2be33d7b314f81c9b886a95d53514689090635f9fad53181f2d3051fd5')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build.PL
  perl Build
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build install
}

