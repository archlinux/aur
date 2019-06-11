# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-linux-inotify2
_lastauthor=M/ML/MLEHMANN
_pkgname=Linux-Inotify2
pkgver=2.1
pkgrel=2
pkgdesc="scalable directory/file change notification"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-common-sense')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('7265b674380026011df82b9d6219a4c980bcdc0efe913119d04878790bf6f270')

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
