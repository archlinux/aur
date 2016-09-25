# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-rinci
_lastauthor=P/PE/PERLANCAR
_pkgname=Rinci
pkgver=1.1.81
pkgrel=1
pkgdesc='Language-neutral metadata for your code entities'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-defhash' 'perl-sah')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('cdf78ff2790ecd89a65492b086ba9d15608e1e58e8eef66c801709e7fd4c7d1b70dbc7e129f4eb77a8cbc9c31fc2d618379c45cf10bcb075c380f11e7ad7f982')

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
