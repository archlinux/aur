# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: garion < garion @ mailoo.org >

pkgname=mkvalidator
pkgver=0.5.0
pkgrel=1
pkgdesc="Validator for MKV files"
arch=('armv6h' 'i686' 'x86_64')
url="http://www.matroska.org/downloads/mkvalidator.html"
license=('BSD')
source=(http://sourceforge.net/projects/matroska/files/mkvalidator/mkvalidator-${pkgver}.tar.bz2)
sha1sums=('e18682430caa02b6b2022b8a1811ff8ac02e861a')
options=(!makeflags)

prepare() {
  cd "mkvalidator-${pkgver}"
  [ "${CARCH}" = "armv6h" ] && find ./corec/tools/coremake/ -type f -exec sed 's|arm-none-linux-gnueabi-||g' -i {} \;
  ./configure

  find . -name '*.mak' -exec sed "s|/usr/local|${pkgdir}/usr|g" -i {} \;
}

build(){
  cd "mkvalidator-${pkgver}/mkvalidator"
  make
}

package(){
  cd "mkvalidator-${pkgver}/mkvalidator"
  mkdir -p "${pkgdir}/usr/bin"
  make install
}
