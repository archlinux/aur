# Maintainer: 3ED <krzysztofas at protonmail dot com>
#
pkgname=perl-shell-perl
_author=FERREIRA
_pkgname=Shell-Perl
pkgver=0.004
pkgrel=1
pkgdesc='A read-eval-print loop in Perl '
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor' 'perl-file-homedir' 'perl-path-class' 'perl-term-readline-perl' )
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-deep')
url="https://metacpan.org/release/${_pkgname}"

_lastauthor=${_author:0:1}/${_author:0:2}/${_author}
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('58f68e0cb945491ca60857911ac4c0045127eb288f880615777c32b577a4a0ec')

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
