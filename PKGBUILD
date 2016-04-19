# Maintainer: Fuxino <dfucini at gmail dot com>
# Contributor: Kaan Genç <aur@kaangenc.me>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: M0Rf30
# Contributor: Samsagax <samsagax@gmail.com>

pkgname=bbswitch-grsec
_pkgname=bbswitch
pkgver=0.8
_extramodules=extramodules-4.4.7-grsec
pkgrel=14
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops for linux-grsec"
arch=('i686' 'x86_64')
url="http://github.com/Bumblebee-Project/bbswitch"
license=('GPL')
depends=('linux-grsec>=4.4.7' 'linux-grsec<4.5')
makedepends=('linux-grsec-headers>=4.4.7' 'linux-grsec-headers<4.5')
install=bbswitch-grsec.install
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz")
sha256sums=('76cabd3f734fb4fe6ebfe3ec9814138d0d6f47d47238521ecbd6a986b60d1477')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  make KDIR=/lib/modules/${_kernver}/build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  
  install -Dm644 bbswitch.ko "${pkgdir}"/usr/lib/modules/${_extramodules}/bbswitch.ko
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/bbswitch.ko"
}
