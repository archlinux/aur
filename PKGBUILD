# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=xaos
pkgver=3.6
pkgrel=4
pkgdesc="A fast portable real-time interactive fractal zoomer"
arch=('x86_64')
url="http://matek.hu/xaos/"
license=('GPL')
depends=('gsl' 'libpng' 'aalib')
options=('!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/xaos/${pkgname}-${pkgver}.tar.gz
        xaos-3.5-build-fix-i686.patch)
sha1sums=('0c68d25c4f9c8eaf557e37d9e4586a04ab56d7a0'
          'd2ea8f0460c79c47fb289a4c2f87fe5c44057f9d')

prepare() {
  cd ${pkgname}-${pkgver}
  if [[ $CARCH == "i686" ]]; then
    patch -p1 -i ../xaos-3.5-build-fix-i686.patch
  fi
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-gsl --with-aa-driver
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
