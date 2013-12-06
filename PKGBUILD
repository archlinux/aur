# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: M0Rf30
# Contributor: Samsagax <samsagax@gmail.com>

pkgname=bbswitch
pkgver=0.8
_extramodules=extramodules-3.12-ARCH # Don't forget to update bbswitch.install
pkgrel=1
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('i686' 'x86_64')
url=("http://github.com/Bumblebee-Project/bbswitch")
license=('GPL')
depends=('linux>=3.12' 'linux<3.13')
makedepends=('linux-headers>=3.12' 'linux-headers<3.13')
install=bbswitch.install
source=("https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz")
md5sums=('5b116b31ace3604ddf9d1fc1f4bc5807')

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
