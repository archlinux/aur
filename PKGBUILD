# bootloader files for raspberry pi from git
# Maintainer: Greyson Christoforo

pkgname=raspberrypi-bootloader-git
pkgver=r968
pkgrel=1
pkgdesc="Bootloader files for raspberry pi from git"
arch=('any')
url="https://github.com/raspberrypi/firmware"
license=('custom')
makedepends=('curl')
provides=('raspberrypi-bootloader' 'raspberrypi-bootloader-x' )
conflicts=('raspberrypi-bootloader' 'raspberrypi-bootloader-x')
_ncommits="$(curl -s -I -k "https://api.github.com/repos/raspberrypi/firmware/commits?per_page=1" | sed -n '/^[Ll]ink:/ s/.*"next".*page=\([0-9]*\).*"last".*/\1/p')"
source=("${_ncommits}.tar.gz::https://api.github.com/repos/raspberrypi/firmware/tarball")
md5sums=('8b297682bc3b62877f5c93697f07e41c')
options=(!strip)

pkgver() {
  printf "r%s" "${_ncommits}"
}

package() {
  cd */
  mkdir -p "${pkgdir}"/boot
  cp boot/{*.dat,*.elf} "${pkgdir}"/boot
}

