# Maintainer: 7Ji <pugokughin@gmail.com>

pkgname=linux-firmware-orangepi
pkgver='20230602.d9c6dac'
pkgrel=1
pkgdesc="Firmware files for Linux - Orange Pi specific firmware"
arch=('aarch64')
url="https://github.com/orangepi-xunlong/firmware"
license=('GPL2' 'GPL3' 'custom')
conflicts=('linux-firmware')
provides=("linux-firmware=${pkgver}")
options=(!strip)
source=(
  "git+https://github.com/orangepi-xunlong/firmware.git"
)

sha256sums=(
  'SKIP'
)

pkgver() {
  cd firmware

  # Commit date + short rev
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

package() {
  install -d -m 755 "${pkgdir}"/usr/lib/firmware
  cp -rva "${srcdir}"/firmware/* "${pkgdir}"/usr/lib/firmware
}