# Maintainer: Renan Guilherme <japareaggae@gmail.com>
# Contributor: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=gsl-firmware-git
pkgver=r286.f188871e7ea3
pkgrel=1
pkgdesc='Firmware for Silead touchscreen controllers'
arch=('any')
url="https://github.com/onitake/gsl-firmware"
license=('custom')
makedepends=('git')
source=("gsl::git+https://github.com/onitake/gsl-firmware.git")
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
 install -Dm 644 ./firmware/linux/silead/* -t "${pkgdir}/usr/lib/firmware/silead/"
}
