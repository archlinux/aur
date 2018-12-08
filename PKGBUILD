# Maintainer: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=gsl-firmware-git
pkgver=r184.4c39712
pkgrel=2
pkgdesc='Firmware for Silead touchscreen controllers'
arch=('i686' 'x86_64')
url="https://github.com/onitake/gsl-firmware"
license=('custom')
makedepends=('git')
source=("gsl::git://github.com/onitake/gsl-firmware.git")
sha512sums=('SKIP')

pkgver() {
  cd ${srcdir}/gsl
  ( set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
 cd ${srcdir}/gsl
 install -Dm 644 ./firmware/linux/silead/* -t "${pkgdir}/lib/firmware/silead/"
}
