# bootloader files for raspberry pi from git
# Maintainer: Greyson Christoforo

pkgname=raspberrypi-bootloader-git
pkgver=r969
pkgrel=1
pkgdesc="Bootloader files for raspberry pi from git"
arch=('any')
url="https://github.com/raspberrypi/firmware"
license=('custom')
makedepends=('curl')
provides=('raspberrypi-bootloader' 'raspberrypi-bootloader-x' )
conflicts=('raspberrypi-bootloader' 'raspberrypi-bootloader-x')
_ncommits="$(curl -s -I -k "https://api.github.com/repos/raspberrypi/firmware/commits?per_page=1" | sed -n '/^[Ll]ink:/ s/.*"next".*page=\([0-9]*\).*"last".*/\1/p')"

#source=("${_ncommits}.tar.gz::https://api.github.com/repos/raspberrypi/firmware/tarball")
source=(https://github.com/raspberrypi/firmware/archive/9d4f640625529b104303a31482f5ccbd2d8da51b.zip)
md5sums=('3339ff79177a4a3f5efd3644213564b8')
options=('!strip')

pkgver() {
  printf "r%s" "${_ncommits}"
}

package() {
  cd */
  mkdir -p "${pkgdir}"/boot
  cp boot/{*.dat,*.elf,*.bin} "${pkgdir}"/boot
}

