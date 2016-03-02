# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-file-moreutil
_lastauthor=P/PE/PERLANCAR
_pkgname=File-MoreUtil
pkgver=0.60
pkgrel=1
pkgdesc='File-related utilities'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-rinci')
checkdepends=('perl-file-slurp-tiny' 'perl-file-chdir')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('eaa8757a738739b2f5f44986f3ec3576163cfb35406aeb7d2a761c98bbbf280b5c5630ee17500bf4848d9d66808f17549f9b94f1399ab2104e3f2f4b031194f4')

conflicts=("perl-sharyanto-file-util")
provides=("perl-sharyanto-file-util")
replaces=("perl-sharyanto-file-util")

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd ${_pkgname}-${pkgver}
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

