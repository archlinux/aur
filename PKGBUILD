# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='libcs50'
pkgver=8.1.2
pkgrel=1
pkgdesc="Harvard's cs50 C library"
arch=('i686' 'x86_64')
url='https://cs50.harvard.edu/'
license=('unknown')
groups=('cs50')
makedepends=('asciidoctor')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/cs50/${pkgname}/archive/v${pkgver}.tar.gz"
  'Makefile.patch')
sha256sums=(
  '886e1aade1ef985c566ed9001f90c378c7ebe8d5b5b67932eac7e94c1a83abbb'
  '43e487367882c54cb258dac3cfc98227918cff59ebc6a2965e18cf3a186b9f10'
)

prepare() {
  cd "${pkgname}-${pkgver}"

  patch < "${srcdir}/Makefile.patch"
}

build() {
  cd "${pkgname}-${pkgver}"

  # TODO: Get this fixed upstream. We should not have to unset our $CFLAGS and
  #       $MAKEFLAGS.
  CFLAGS= MAKEFLAGS= make
}

package() {
  cd "${pkgname}-${pkgver}"

  # TODO: Get this fixed upstream. We should not have to unset our $CFLAGS and
  #       $MAKEFLAGS.
  CFLAGS= MAKEFLAGS= DESTDIR="${pkgdir}/usr" make install
  rm "${pkgdir}/usr/src/cs50.c"
  install -d -m 755 "${pkgdir}/usr/src/libcs50"
  install -m 644 src/cs50.c src/cs50.h -t "${pkgdir}/usr/src/libcs50"
}

# vim: ts=2 sw=2 et:
