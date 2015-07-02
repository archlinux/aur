# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-www-mixcloud
_lastauthor=A/AJ/AJCT
_pkgname=WWW-Mixcloud
pkgver=0.01
pkgrel=1
pkgdesc="Perl wrapper for the Mixcloud API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime-format-atom' 'perl-json' 'perl-libwww' 'perl-namespace-autoclean')
makedepends=('perl-extutils-makemaker')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('01f3954e29bdd51799e56a0c73875620a5337c90af7ea39a0b9701104a14b35a')

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

