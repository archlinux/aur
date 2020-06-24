# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-linux-inotify2
_lastauthor=M/ML/MLEHMANN
_pkgname=Linux-Inotify2
pkgver=2.2
pkgrel=2
pkgdesc="scalable directory/file change notification"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-common-sense')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('dd41a20da5689fb2071eea23a383c4e0f8d85b462ba65baa6c4f53a254ed3433')

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
