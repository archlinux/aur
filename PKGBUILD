# Montainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-prima
_lastauthor=K/KA/KARASIK
_pkgname=Prima
pkgver=1.52
pkgrel=1
pkgdesc="a perl multiplatform graphic toolkit"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-config-simple' 'perl-anyevent')
makedepends=('perl-extutils-makemaker')
checkdepends=()
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('09dae9e6bbd9a0807554653ef26aed74f2e2de112b31a62a12a5c4a8d5648ecb89a9a153cb843919d5946b04a0beea17d2beca29e98bf4eee2c016a39f244f52')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

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
