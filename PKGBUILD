# Maintainer: Clarke <mrlusberg@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Boyan Ding <stu_dby@126.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgbase=bbswitch-mainline
pkgorigin=bbswitch
pkgname=(bbswitch-mainline)
pkgver=0.8
pkgrel=1
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('x86_64')
url="http://github.com/Bumblebee-Project/bbswitch"
license=('GPL')
depends=('linux-mainline>=5.0rc1-1')
makedepends=('linux-mainline-headers>=5.0rc1-1')
replaces=('bbswitch')
_extramodules=extramodules-mainline
source=("${pkgorigin}-${pkgver}.tar.gz::https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz")
md5sums=('5b116b31ace3604ddf9d1fc1f4bc5807')

build() {
  cd ${pkgorigin}-${pkgver}
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  make KDIR=/lib/modules/${_kernver}/build
}

package_bbswitch-mainline() {
  cd ${pkgorigin}-${pkgver}
  install -Dt "${pkgdir}/usr/lib/modules/${_extramodules}" -m644 *.ko
  find "${pkgdir}" -name '*.ko' -exec xz {} +
}
