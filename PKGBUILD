# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-b-c
_lastauthor=R/RU/RURBAN
_pkgname=B-C
pkgver=1.52
pkgrel=1
pkgdesc="Perl compiler's C backend"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ipc-run' 'perl-opcodes' 'perl-b-flags' 'perl-time-hires')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz
        01-cc_runtime_DESTDIR_fix.patch)
sha256sums=('072b4b9e39431ad8ef5173557c26ade97f985cf150f6580a20f42dd9fc3651a7'
            '51ad82da600c68f19858efb1f61883750a10048d3a86924ec65521d1edcd9353')

prepare() {
  patch -p0 -i "01-cc_runtime_DESTDIR_fix.patch"
}
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
