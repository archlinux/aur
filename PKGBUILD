# Mantainer: 3ED <krzysztofas at protonmail dot com>
#
pkgname=perl-b-c
_lastauthor=R/RU/RURBAN
_pkgname=B-C
pkgver=1.55
pkgrel=1
pkgdesc="Perl compiler's C backend"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ipc-run' 'perl-opcodes' 'perl-b-flags' 'perl-time-hires')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('09236d67d679bb477e0af78207235e038e1dec72635f6c7d78f387ddeb602b00')

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
