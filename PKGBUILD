# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: M0Rf30
# Contributor: Samsagax <samsagax@gmail.com>

pkgname=bbswitch
pkgver=0.7
_extramodules=extramodules-3.9-ARCH # Don't forget to update bbswitch.install
pkgrel=1
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('i686' 'x86_64')
url=("http://github.com/Bumblebee-Project/bbswitch")
license=('GPL')
depends=('linux>=3.9' 'linux<3.10')
makedepends=('linux-headers>=3.9' 'linux-headers<3.10')
install=bbswitch.install
source=("https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz")
md5sums=('b9df5ea40109ef9766448a0577c798e6')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
   
  make KDIR=/usr/src/linux-${_kernver}
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
   
  install -Dm644 bbswitch.ko "${pkgdir}"/usr/lib/modules/${_extramodules}/bbswitch.ko
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/bbswitch.ko"                      
}
