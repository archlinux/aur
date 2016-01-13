# Maintainer: Wesley Chan <address at domain dot com>

pkgname=microchip-pic32-legacy-plib
pkgver=1.00
pkgrel=1
pkgdesc="Microchip's PIC32 peripheral support libraries."
arch=('any')
url=http://www.microchip.com/pagehandler/en-us/devtools/mplabxc/home.html?tab=t2
license=(custom)
depends=(microchip-mplabxc32-bin)
depends_i688=(gcc-libs)
depends_x86_64=(lib32-gcc-libs)
makedepends=(sdx)
makedepends_x86_64=(lib32-tclkit)
makedepends_i686=(tclkit)

options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
source=("http://ww1.microchip.com/downloads/en/DeviceDoc/PIC32%20Legacy%20Peripheral%20Libraries%20Linux.tar"
        "bitrock-unpacker.tcl")

sha256sums=('644edc09b5164dbfe80c4f42c12fe506b58481bd71e4d0228b62ec7c305d027f'
            '1bcb58cdbb6e4a89415cf91cb6692aa0ada3abb41d22134510f8477ffd90b8a2')

PKGEXT='.pkg.tar'

build() {
  msg2 "Unpacking files from installer"
  ./bitrock-unpacker.tcl ./PIC32\ Legacy\ Peripheral\ Libraries.run ./unpacked.vfs
}

package() {
  mkdir -p "${pkgdir}"`ls -rd /opt/microchip/xc32/*/ | { read first rest ; echo $first; }`
  mv ${srcdir}/unpacked.vfs/default/programfileswindows/* "${pkgdir}"`ls -rd /opt/microchip/xc32/*/ | { read first rest ; echo $first; }`
}
