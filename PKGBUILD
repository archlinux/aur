# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-moosex-poe
_lastauthor=G/GE/GETTY
_pkgname=MooseX-POE
pkgver=0.215
pkgrel=3
pkgdesc="The Illicit Love Child of Moose and POE"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-fatal')
depends=('perl-moose' 'perl-poe')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('49ad7db943b5e4989be1f68c1f0447cf9637554974ed5a3a47a4279a7f02302f')

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
