# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Piotr Gorski <sir_lucjan@openlinux.pl>
# Contributor: Boyan Ding <stu_dby@126.com>

pkgname=bbswitch-uksm-ck
pkgver=0.8
_realname=bbswitch
_extramodules=extramodules-4.0-uksm-ck 
pkgrel=7
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops for linux-uksm-ck"
arch=('i686' 'x86_64')
url=("http://github.com/Bumblebee-Project/bbswitch")
license=('GPL')
depends=('linux-uksm-ck>=4.0' 'linux-uksm-ck<4.1')
makedepends=('linux-uksm-ck-headers>=4.0' 'linux-uksm-ck-headers<4.1')
install=${pkgname}.install
source=("${url}/archive/v${pkgver}.tar.gz")
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
