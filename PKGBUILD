# Maintainer: Boyan Ding <stu_dby@126.com>

pkgname=bbswitch-lts318-ck
pkgver=0.8
_realname=bbswitch
_extramodules=extramodules-3.18-lts318-ck # Don't forget to update bbswitch-ck.install
pkgrel=1
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops for linux-lts318-ck"
arch=('i686' 'x86_64')
url=("http://github.com/Bumblebee-Project/bbswitch")
license=('GPL')
depends=('linux-lts318-ck>=3.18.0' 'linux-lts318-ck<3.19.0')
makedepends=('linux-lts318-ck-headers>=3.18.0' 'linux-lts318-ck-headers<3.19')
install=bbswitch-lts318-ck.install
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
