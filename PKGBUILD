# Maintainer: 3ED <krzysztofas at protonmail dot com>
#
pkgname=perl-log-ger
_author=PERLANCAR
_pkgname=Log-ger
pkgver=0.023
pkgrel=1
pkgdesc="a lightweight, flexible logging framework"
arch=('any')
license=('PerlArtistic')
depends=()
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"

options=('!emptydirs')
_lastauthor=${_author:0:1}/${_author:0:2}/${_author}
source=("https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('81c29cc783309cb020263375a4f5c011b5d444e6cd14ab3a7b1ba1816e64ebbe')

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
  cd ${_pkgname}-${pkgver}
  make test
}
package() {
  cd ${_pkgname}-${pkgver}
  make install
}

