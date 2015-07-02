# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-term-progressbar-quiet
_lastauthor=L/LB/LBROCARD
_pkgname=Term-ProgressBar-Quiet
pkgver=0.31
pkgrel=2
pkgdesc='Provide a progress meter if run interactively'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-interactive' 'perl-term-progressbar' 'perl-test-mockobject')
checkdepends=('perl-test-simple')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('f48502ac57d236678159e7b6efd70007bb9ea7b27da7d933c53ccfeab562c6e88c291cd002fc65af8ccc98ff8843a5221048276351491cb324f548bf3cdf3934')

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

