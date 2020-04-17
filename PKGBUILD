# Maintainer: 3ED <krzysztofas at protonmail dot com>
#
pkgname=perl-sah
_author=PERLANCAR
_pkgname=Sah
pkgver=0.9.49
pkgrel=1
pkgdesc='Schema for data structures'
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=('perl-defhash')
url="https://metacpan.org/release/${_pkgname}"

_lastauthor=${_author:0:1}/${_author:0:2}/${_author}
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('28f300814c54e9f17a497f80e4ef634e1a2b4aaa88e037bf010e01600aaba85ad1df10a5247c00ae98c9d7b1c91b8034a988684b47199c624d2060dd34710ae7')

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
