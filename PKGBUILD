# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-string-bash
_lastauthor=A/AJ/AJGB
_pkgname=String-Bash
pkgver=1.110960
pkgrel=1
pkgdesc='Parameter expansion in strings'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-regexp-common' 'perl-sub-exporter' 'perl-padwalker')
checkdepends=('perl-test-nowarnings')
makedepends=('perl-module-build')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('c7da66692bc0385ac3de8ae86b38bb25327b251b85a3b66e64a6a75d6dff453b')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build.PL
  perl Build
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build install
}

