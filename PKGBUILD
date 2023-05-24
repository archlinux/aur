# Maintainer: Stunts <stunts@pinamartins.com>
_pkgname=sbx-h6-rgb
pkgname=${_pkgname}-git
pkgver=r12.edbf86a
pkgrel=1
pkgdesc=" Creative SoundblasterX RGB LED setter"
arch=(any)
url="https://github.com/Oscillope/sbx-h6-rgb"
license=('None')
depends=()
makedepends=('git')
source=('git+https://github.com/Oscillope/sbx-h6-rgb.git' 'sbx-h6-off.service')
sha256sums=('SKIP' 'd5478d5fb69a17b1bb4e72ef18f207ce2ddf30df6a08df410422f8d0e2f4227c')

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd ${srcdir}/${_pkgname}
  make
}

package() {
  install -D sbx-h6-off.service ${pkgdir}/usr/lib/systemd/system/sbx-h6-off.service
  cd ${srcdir}/${_pkgname}
  install -D sbx-h6-ctl ${pkgdir}/usr/bin/sbx-h6-ctl
}
