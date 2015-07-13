# Maintainer: Claire Farron <diesal3@googlemail.com>
# Contributor: Boyan Ding <stu_dby@126.com> - Maintainer of bbswitch-ck

pkgname=bbswitch-lts-ck
pkgver=0.8
_realname=bbswitch
_extramodules=extramodules-3.14-lts-ck # Don't forget to update bbswitch-lts-ck.install
pkgrel=25
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops for linux-ck"
arch=('i686' 'x86_64')
url=("http://github.com/Bumblebee-Project/bbswitch")
license=('GPL')
depends=('linux-lts-ck=3.14.48')
makedepends=('linux-lts-ck-headers=3.14.48')
provides=('bbswitch')
install=bbswitch-lts-ck.install
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
