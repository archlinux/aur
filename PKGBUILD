# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-shell-perl
_lastauthor=R/RS/RSAVAGE
_pkgname=Shell-Perl
pkgver=0.0023
pkgrel=2
pkgdesc='A read-eval-print loop in Perl '
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor' 'perl-file-homedir' 'perl-path-class' 'perl-file-slurp')
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-deep')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tgz)
sha256sums=('9ccdf053f9d924c052850a832d8e6062ea903c7c91df1d3ac6c53980fa40288c')

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
