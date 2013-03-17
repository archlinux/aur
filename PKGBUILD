# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: M0Rf30
# Contributor: Samsagax <samsagax@gmail.com>

pkgname=bbswitch
pkgver=0.5
_extramodules=extramodules-3.7-ARCH # Don't forget to update bbswitch.install
pkgrel=2
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('i686' 'x86_64')
url=("http://github.com/Bumblebee-Project/bbswitch")
license=('GPL')
depends=('linux>=3.7' 'linux<3.8')
makedepends=('linux-headers>=3.7' 'linux-headers<3.8')
install=bbswitch.install
source=("https://github.com/downloads/Bumblebee-Project/bbswitch/${pkgname}-${pkgver}.tar.gz")
md5sums=('5e0e6eb9c5e8c10db56e5b349b43bba7')

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
