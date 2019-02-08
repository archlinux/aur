# Maintainer: Grey Christoforo <first name at last name dat net>

pkgname=f-engrave
pkgver=1.66
pkgrel=2
pkgdesc="Supports Engraving and V-Carving"
url="http://www.scorchworks.com/Fengrave/fengrave.html"
arch=('x86_64')
license=('GPLv3')
makedepends=('dos2unix')
depends=('python')
source=(http://www.scorchworks.com/Fengrave/F-Engrave-${pkgver}_src.zip arch.patch)
md5sums=('63dbde2b6472d66a847438481208457e'
         '0024e18a0fd00d5fd455b783264e6923')

prepare() {
  cd F-Engrave-${pkgver}_src
  #sed -i "s,159,${pkgver//./},g" -i ../arch.patch
  patch < ../arch.patch
  dos2unix ${pkgname}.py
}

build() {
  cd F-Engrave-${pkgver}_src/TTF2CXF_STREAM
  make
}

package() {
  cd F-Engrave-${pkgver}_src
  install -Dm755 ${pkgname}.py "$pkgdir/usr/bin/${pkgname}"
  cd TTF2CXF_STREAM
  install -Dm755 ttf2cxf_stream "$pkgdir/usr/bin/ttf2cxf_stream"
}

# vim:set ts=2 sw=2 et:
