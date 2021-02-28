# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Laszlo Papp <djszapi2 at gmail dot com>
# Contributor: Shinlun Hsieh <yngwiexx at yahoo dot com dot tw>

pkgname=gxemul
pkgver=0.6.3.1
pkgrel=1
pkgdesc='Instruction-level machine emulator'
arch=('i686' 'x86_64')
url='http://gavare.se/gxemul/'
license=('GPL')
depends=('libx11' 'sh')
source=("http://gavare.se/gxemul/src/gxemul-${pkgver}.tar.gz")
sha256sums=('e9dd60b97c2c148def1c63d7e2a5bc85550fca6f88e323886739ba6166b78761')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure \
    --disable-valgrind \
    --without-unittests

  sed -i 's|$(DESTDIR)$(MANDIR)/man1|$(PREFIX)/share/man/man1|g' Makefile

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make PREFIX=${pkgdir}/usr install
}
