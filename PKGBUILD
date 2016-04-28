# Maintainer: Distorted <derhaeg_michiel@hotmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Boyan Ding <stu_dby@126.com>

_realname=bbswitch
_extramodules=extramodules-4.5-ck # Don't forget to update bbswitch-ck.install
pkgname=bbswitch-ck
pkgver=0.8
pkgrel=16
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops for linux-ck"
arch=('i686' 'x86_64')
url="http://github.com/Bumblebee-Project/bbswitch"
license=('GPL')
depends=('linux-ck>=4.5' 'linux-ck<4.6')
makedepends=('linux-ck-headers>=4.5' 'linux-ck-headers<4.6')
provides=('bbswitch')
install=${pkgname}.install
source=("v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('5b116b31ace3604ddf9d1fc1f4bc5807')

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  make KDIR=/lib/modules/${_kernver}/build
}

package() {
  cd ${srcdir}/${_realname}-${pkgver}
  install -Dm644 bbswitch.ko "${pkgdir}"/usr/lib/modules/${_extramodules}/bbswitch.ko
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/bbswitch.ko"
}
