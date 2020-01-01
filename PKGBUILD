# Maintainer: 3ED <krzysztofas at protonmail dot com>
#
pkgname=perl-log-ger
_author=PERLANCAR
_pkgname=Log-ger
pkgver=0.028
pkgrel=1
pkgdesc="a lightweight, flexible logging framework"
arch=('any')
license=('PerlArtistic')
depends=('perl')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"

options=('!emptydirs')
_lastauthor=${_author:0:1}/${_author:0:2}/${_author}
source=("https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c6096197375ef6de02ed8d7fc54c35c7c0cc10463132a201092b32b5dbe01e26')

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

