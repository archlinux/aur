# Maintainer: e5ten <e5ten.arch@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: M0Rf30
# Contributor: Samsagax <samsagax@gmail.com>

pkgname=bbswitch-lts
_basename=bbswitch
pkgver=0.8
_extramodules=extramodules-4.14-lts # Don't forget to update bbswitch-lts.install
pkgrel=45
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('x86_64')
url="http://github.com/Bumblebee-Project/bbswitch"
license=('GPL')
depends=('linux-lts>=4.14' 'linux-lts<4.15')
makedepends=('linux-lts-headers>=4.14' 'linux-lts-headers<4.15')
install=${pkgname}.install
source=("${_basename}-$pkgver.tar.gz::https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz")
md5sums=('5b116b31ace3604ddf9d1fc1f4bc5807')

build() {
  cd ${srcdir}/${_basename}-${pkgver}
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  make KDIR=/lib/modules/${_kernver}/build
}

package() {
  cd ${_basename}-${pkgver}
  install -Dt "${pkgdir}/usr/lib/modules/${_extramodules}" -m644 *.ko
  find "${pkgdir}" -name '*.ko' -exec xz {} +
}

