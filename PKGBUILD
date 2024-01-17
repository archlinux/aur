# Maintainer: Edmund Lodewijks <e.lodewijks@gmail.com>
# Contributor: MayorBender <7480812+kingy9000@users.noreply.github.com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Justine Paul <jestine-paul@dsi.a-star.edu.sg>
# Contributor: justinus <jestine.paul@gmail.com>

pkgname='libcs50'
pkgver=11.0.2
pkgrel=5
pkgdesc="CS50 Library for C"
arch=('i686' 'x86_64')
url='https://github.com/cs50/libcs50'
license=('GPL-3.0-only')
optdepends=('clang: compiler currently used in CS50x course (2023)')
groups=('cs50')
conflicts=('libcs50-git')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/cs50/${pkgname}/archive/v${pkgver}.tar.gz"
  'Makefile.patch'
)
sha256sums=('3439547f7a73cae96d9208c24bbd1f6e7cf055acaba6ac30362e8f32fd521e36'
            '4a10efd4f4f6b6bb18152a4f28497f7f8562aaa5aaf50c401d308827b922ef3f')
install=libcs50.install

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
