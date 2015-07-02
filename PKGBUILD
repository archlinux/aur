# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-file-moreutil
_lastauthor=P/PE/PERLANCAR
_pkgname=File-MoreUtil
pkgver=0.59
pkgrel=2
pkgdesc='File-related utilities'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-rinci')
checkdepends=('perl-file-slurp-tiny' 'perl-file-chdir')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('b3af675f48216f8cced9f35ec63a5148cc610dde94e4408a9b3f60ad8662452d9d1bc0a5b5e68dd10b8e1377973e16243c7dfe667a82428326b8e369ac9af3af')

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

