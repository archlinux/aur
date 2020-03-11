# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >
# Contributor: Distorted <derhaeg_michiel@hotmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Boyan Ding <stu_dby@126.com>

_realname=bbswitch
_minVer=5.5
_maxVer=5.6
pkgname=bbswitch-ck
pkgver=0.8
pkgrel=29
_kernver="$(uname -r)"
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops for linux-ck"
arch=('i686' 'x86_64')
url="http://github.com/Bumblebee-Project/bbswitch"
license=('GPL')
depends=("linux-ck>=$_minVer" "linux-ck<=$_maxVer")
makedepends=('linux-ck-headers')
provides=('bbswitch')
install=${pkgname}.install
source=("v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('5b116b31ace3604ddf9d1fc1f4bc5807')

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  make KDIR=/lib/modules/${_kernver}/build
}

package() {
  cd ${srcdir}/${_realname}-${pkgver}
  install -Dm644 bbswitch.ko "${pkgdir}"/usr/lib/modules/${_kernver}/bbswitch.ko
  gzip "${pkgdir}/usr/lib/modules/${_kernver}/bbswitch.ko"
}
