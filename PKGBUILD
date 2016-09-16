# Maintainer: Sebastian Wolf <fatmike303 at gmail dot com>
pkgname=ef3usb
pkgver=1.93
pkgrel=1
pkgdesc='all-in-1 utility for the EasyFlash3 cartridge and its USB connection to the PC'
arch=('i686' 'x86_64')
url='http://csdb.dk/release/?id=146366'
depends=('libftdi-compat')
license=('unknown')
source=("http://csdb.dk/getinternalfile.php/151365/ef3utils193.zip")
sha256sums=('e5b58cb2c835f57c65b6643f66b13c21306f6575b41de9b67b932bc46a59e3f4')

build() {
  cd $srcdir/Src
  sed -i '1s/^/#include <stdint.h>\n/' ${pkgname}.c
  gcc ${pkgname}.c -lftdi -o ${pkgname} || return 1
}

package() {
  install -D ${srcdir}/Src/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -D ${srcdir}/readme.txt ${pkgdir}/usr/share/${pkgname}/readme.txt
  install -D ${srcdir}/${pkgname}.prg ${pkgdir}/usr/share/${pkgname}/${pkgname}.prg
}

