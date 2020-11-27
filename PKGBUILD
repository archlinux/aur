# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-menlo
_lastauthor=M/MI/MIYAGAWA
_pkgname=Menlo
pkgver=1.9019
pkgrel=1
pkgdesc='A CPAN client'
arch=('any')
license=('PerlArtistic' 'GPL')
depends=(
	perl-capture-tiny
	perl-class-tiny
	perl-cpan-common-index
	perl-cpan-distnameinfo
	perl-cpan-meta
	perl-cpan-meta-check
	perl-extutils-config
	perl-extutils-helpers
	perl-extutils-installpaths
	perl-file-which
	perl-json-pp
	perl-local-lib
	perl-module-cpanfile
	perl-parse-pmfile
	perl-string-shellquote
	perl-uri
)
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('3b573f68e7b3a36a87c860be258599330fac248b518854dfb5657ac483dca565')

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

