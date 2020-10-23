# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>

# BUILD INSTRUCTIONS
#
# The source for `blhost` is available behind a login wall.
# Visit <https://www.nxp.com/webapp/Download?colCode=blhost_2.6.2&appType=license>,
# accept the license terms, and place the downloaded ZIP file in the same directory as this PKGBUILD,
# then try building again.

# N.B.: The ZIP file lacks files such as blhost.cpp and common.mk,
#       which prevents offering a non-prebuilt `blhost` PKGBUILD.

pkgname=blhost-bin
_pkgname=blhost
pkgver=2.6.2
pkgrel=1
pkgdesc="Bootloader Host Application for NXP MCUs"
url="https://www.nxp.com/design/software/development-software/mcuxpresso-software-and-tools-/mcuboot-mcu-bootloader-for-nxp-microcontrollers:MCUBOOT"
# could also support 32-bit with some more work
arch=(x86_64)
license=(custom:NXP)
depends=()
provides=($_pkgname)
conflicts=($_pkgname)

download_url="https://www.nxp.com/webapp/Download?colCode=${_pkgname}_${pkgver}&appType=license"
DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please download from ${download_url} and read the PKGBUILD ${ALL_OFF}" $DLAGENTS[@])
source=(file://${_pkgname}_$pkgver.zip)
sha256sums=("2e7aa1aa430fbbe01093412f97d618e1773ea40f2f6f24ffcc1e26102d36eb2b")

# build() {
#   cd $srcdir/${_pkgname}_$pkgver/proj/$_pkgname/gcc
#   make all
# }

package() {
  bin=$srcdir/${_pkgname}_$pkgver/bin/linux/amd64
  install -Dm 755 $bin/$_pkgname -t $pkgdir/usr/bin
}
