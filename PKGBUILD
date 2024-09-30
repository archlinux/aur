# Maintainer: Giovan Battista "giomba" Rolandi <giomba at glgprograms dot it>
pkgname=2cdt
pkgver=1.4
pkgrel=2
pkgdesc="Create CDT/TZX for Amstrad/Spectrum out of raw files"
arch=('x86_64')
url="http://cpctech.cpcwiki.de/download/2cdt.zip"
license=('GPL2')
depends=()
# official source is the following, but SSL certificate keeps breaking
# http://cpctech.cpcwiki.de/download/2cdt.zip
source=('https://box.glgprograms.it/users/giomba/2cdt.zip' '0001-fix-incompatible-pointer-types.patch')
sha256sums=('5ffe321b111203f4d901da5c83999179138d4bec5d9771d085e084c195bbe82c' '38ca5880f06cee2f6eafdd41d3f005b504adeb8f79226cee183662866c028e35')

prepare() {
  patch "${srcdir}/${pkgname}/src/2cdt.c" 0001-fix-incompatible-pointer-types.patch
}

build() {
  cd "${srcdir}/${pkgname}"
  make clean
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  mkdir -p ${pkgdir}/usr/bin
  install -m755 ${srcdir}/${pkgname}/2cdt ${pkgdir}/usr/bin
}

