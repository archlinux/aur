# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Laszlo Papp <djszapi2 at gmail dot com>
# Contributor: Shinlun Hsieh <yngwiexx at yahoo dot com dot tw>

pkgname=gxemul
pkgver=0.6.2
pkgrel=1
pkgdesc='Instruction-level machine emulator'
arch=('i686' 'x86_64')
url='http://gavare.se/gxemul/'
license=('GPL')
makedepends=('doxygen')
depends=('libx11' 'sh')
source=("http://gavare.se/gxemul/src/gxemul-${pkgver}.tar.gz")
sha256sums=('a703ac7965feb3c701c7677d78c353f0efa1af4d36a9508fb045eb63dd571547')

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
