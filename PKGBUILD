pkgname=bbswitch-e531
_basename=bbswitch
groups=('ThinkPad-E531')
pkgver=0.8
_extramodules=extramodules-4.1-e531 # Don't forget to update bbswitch-lts.install
pkgrel=4
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('i686' 'x86_64')
url=("http://github.com/Bumblebee-Project/bbswitch")
license=('GPL')
depends=('linux-e531>=4.1' 'linux-e531<4.2')
makedepends=('linux-e531-headers>=4.1' 'linux-e531-headers<4.2')
install=${pkgname}.install
source=("${_basename}-$pkgver.tar.gz::https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz")
sha256sums=('76cabd3f734fb4fe6ebfe3ec9814138d0d6f47d47238521ecbd6a986b60d1477')

build() {
  cd ${srcdir}/${_basename}-${pkgver}

  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

  make KDIR=/lib/modules/${_kernver}/build
}

package() {
  cd ${srcdir}/${_basename}-${pkgver}
   
  install -Dm644 bbswitch.ko "${pkgdir}"/usr/lib/modules/${_extramodules}/bbswitch.ko
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/bbswitch.ko"                      
}
