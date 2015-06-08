# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Boyan Ding <stu_dby@126.com> - Maintainer of bbswitch-ck

_realname=bbswitch
_extramodules=extramodules-4.1-mainline # Don't forget to update 
pkgname=bbswitch-mainline
pkgver=0.8
pkgrel=5
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops for linux-mainline"
arch=('i686' 'x86_64')
url=("http://github.com/Bumblebee-Project/bbswitch")
license=('GPL')
depends=('linux-mainline>=4.1rc1' 'linux-mainline<4.2rc1')
makedepends=('linux-mainline-headers>=4.1rc1' 'linux-mainline-headers<4.2rc1')
provides=('bbswitch')
install=${pkgname}.install
source=("https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz")
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
